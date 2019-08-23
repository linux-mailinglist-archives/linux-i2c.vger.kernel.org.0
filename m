Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7DF9A9B8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2019 10:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387782AbfHWIJp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Aug 2019 04:09:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:25296 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1733287AbfHWIJp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Aug 2019 04:09:45 -0400
X-UUID: ea16a705c0fa430b86e661066209a169-20190823
X-UUID: ea16a705c0fa430b86e661066209a169-20190823
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <qii.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 232667969; Fri, 23 Aug 2019 16:09:39 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs01n1.mediatek.inc
 (172.21.101.68) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 23 Aug
 2019 16:09:30 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 23 Aug 2019 16:09:27 +0800
Message-ID: <1566547772.19935.2.camel@mhfsdcap03>
Subject: Re: [PATCH v2] i2c: mediatek: disable zero-length transfers for
 mt8183
From:   Qii Wang <qii.wang@mediatek.com>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jun Gao <jun.gao@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>
Date:   Fri, 23 Aug 2019 16:09:32 +0800
In-Reply-To: <20190822094516.55130-1-hsinyi@chromium.org>
References: <20190822094516.55130-1-hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2019-08-22 at 17:45 +0800, Hsin-Yi Wang wrote:
> When doing i2cdetect quick write mode, we would get transfer
> error ENOMEM, and i2cdetect shows there's no device at the address.
> Quoting from mt8183 datasheet, the number of transfers to be
> transferred in one transaction should be set to bigger than 1,
> so we should forbid zero-length transfer and update functionality.
> 
> Incorrect return:
> localhost ~ # i2cdetect -q -y 0
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
> 
> After this patch:
> localhost ~ #  i2cdetect -q -y 0
> Error: Can't use SMBus Quick Write command on this bus
> 
> localhost ~ #  i2cdetect -y 0
> Warning: Can't use SMBus Quick Write command, will skip some addresses
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:
> 10:
> 20:
> 30: -- -- -- -- -- -- -- --
> 40:
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60:
> 70:
> 
> Reported-by: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change from v1:
> * restore the order of algo and quirks
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 252edb433fdf..29eae1bf4f86 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -234,6 +234,10 @@ static const struct i2c_adapter_quirks mt7622_i2c_quirks = {
>  	.max_num_msgs = 255,
>  };
>  
> +static const struct i2c_adapter_quirks mt8183_i2c_quirks = {
> +	.flags = I2C_AQ_NO_ZERO_LEN,
> +};
> +
>  static const struct mtk_i2c_compatible mt2712_compat = {
>  	.regs = mt_i2c_regs_v1,
>  	.pmic_i2c = 0,
> @@ -298,6 +302,7 @@ static const struct mtk_i2c_compatible mt8173_compat = {
>  };
>  
>  static const struct mtk_i2c_compatible mt8183_compat = {
> +	.quirks = &mt8183_i2c_quirks,
>  	.regs = mt_i2c_regs_v2,
>  	.pmic_i2c = 0,
>  	.dcm = 0,
> @@ -870,7 +875,11 @@ static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
>  
>  static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
>  {
> -	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +	if (adap->quirks->flags & I2C_AQ_NO_ZERO_LEN)
> +		return I2C_FUNC_I2C |
> +			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> +	else
> +		return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;

It can be removed?

>  }
>  
>  static const struct i2c_algorithm mtk_i2c_algorithm = {


