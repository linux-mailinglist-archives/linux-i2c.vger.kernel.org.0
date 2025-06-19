Return-Path: <linux-i2c+bounces-11519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148FADFC9A
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 06:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67F747A2808
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 04:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B69119F42C;
	Thu, 19 Jun 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JqDtFM4T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2686813EFE3;
	Thu, 19 Jun 2025 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750308521; cv=none; b=ESrVW7p/fEbTiBQMlYgnGo6TOIBvEtqqpZppV5+KMVb0ClCMGsKNS8SWywjMxEfSij7YOETk7XY3Y1pPpGM+31fnXVqrSk9F2DJOc2G6D8DE9Z+mlBCnQDmICVCAuR8YgmCYAVFMyewQJ8W8MpI65mK+Q5tdG4zEeP4ZQd6wOUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750308521; c=relaxed/simple;
	bh=HQe6kFqMnGfN90tLffrWeZBRc3+Eq0D1MY7dEgvGzJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWPPD1GhFD5b7qt4bNp5C+oI0EMqaIUBt1gW5hCbLCa1t6LcgwhBnxu+pecC/lSuvzQvOk90viXytQIgA9BiXeJywSSbn1jY8Qae+4NIJxLcKyNV7cyJIM8qkdfxEYRXw0Svff45n1X49570TistbGNX3WaZ2plh226rZgAzNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JqDtFM4T; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6839B10244BE3;
	Thu, 19 Jun 2025 06:41:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1750308113;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UUFN8WMuMRa5w96HoPF9UjI+t8hy8L5sn99KTr/bq7k=;
	b=JqDtFM4TwU8AK2faCKlq59XOjlaV0KHeCPrlluSzgu2SSq570o5mSohAttlhWMUaJeGeLe
	6ApCTbAqNOAzmm1RfkD9bMN8DHVvbKmsZETU1Y4DHt5M8bM2KSofd3EMjGVDOrqG//+2D0
	lOoZKoFEWkPpO1OiiHVsLacd5FrBH1Wm/3Lw8bX6ir/9yzlZhmeByI8kYt2RUimE94S3tl
	/QDo17C5bjc153RotlaDuxZI5/IRt2SdlwxEm1kHR5rN71qvdb3zUTeAwD2M8QJB17SMmY
	lIqzc9ep1YdXHK9aXb6O+Pe8plPktIdXdaSZHKVFHAQAuM6VJiYbbUXtZOMYUw==
Message-ID: <04497f71-498a-1d12-5cae-a6e0c4e77dc9@denx.de>
Date: Thu, 19 Jun 2025 06:42:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] HID: mcp2221: set gpio pin mode
Content-Language: en-US
To: linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Rishi Gupta <gupt21@gmail.com>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20250608163315.24842-1-hs@denx.de>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <20250608163315.24842-1-hs@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi all,

On 08.06.25 18:33, Heiko Schocher wrote:
> in case we have GPIOLIB enabled the gpio pins are used
> from the current driver as gpio pins. But may the gpio
> functions of this pins are not enabled in the flash
> of the chip and so gpio access fails.
> 
> In case CONFIG_IIO is not enabled we can prevent this
> issue of the driver simply by enabling the gpio mode
> for all pins.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> ---
> 
>   drivers/hid/hid-mcp2221.c | 97 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)

Got message from patchwork:
The following patch (submitted by you) has been updated in Patchwork:
"""
  * linux-i2c: HID: mcp2221: set gpio pin mode
      - http://patchwork.ozlabs.org/project/linux-i2c/patch/20250608163315.24842-1-hs@denx.de/
      - for: Linux I2C development
     was: New
     now: Not Applicable
"""

May I ask to which tree I should rebase my patch, so I can
resend? Just rebased my local patch to:

*   fb4d33ab452e - (origin/master, origin/HEAD, master) Merge tag '6.16-rc2-ksmbd-server-fixes' of 
git://git.samba.org/ksmbd

and it worked without problems.

And while at it, are there any issues with this patch or is it ready for
picking up?

Thanks!

bye,
Heiko
> 
> diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> index 0f93c22a479f..f693e920dffe 100644
> --- a/drivers/hid/hid-mcp2221.c
> +++ b/drivers/hid/hid-mcp2221.c
> @@ -55,6 +55,27 @@ enum {
>   	MCP2221_ALT_F_NOT_GPIOD = 0xEF,
>   };
>   
> +/* MCP SRAM read offsets cmd: MCP2221_GET_SRAM_SETTINGS */
> +enum {
> +	MCP2221_SRAM_RD_GP0 = 22,
> +	MCP2221_SRAM_RD_GP1 = 23,
> +	MCP2221_SRAM_RD_GP2 = 24,
> +	MCP2221_SRAM_RD_GP3 = 25,
> +};
> +
> +/* MCP SRAM write offsets cmd: MCP2221_SET_SRAM_SETTINGS */
> +enum {
> +	MCP2221_SRAM_WR_GP_ENA_ALTER = 7,
> +	MCP2221_SRAM_WR_GP0 = 8,
> +	MCP2221_SRAM_WR_GP1 = 9,
> +	MCP2221_SRAM_WR_GP2 = 10,
> +	MCP2221_SRAM_WR_GP3 = 11,
> +};
> +
> +#define MCP2221_SRAM_GP_DESIGN_MASK		0x07
> +#define MCP2221_SRAM_GP_DIRECTION_MASK		0x08
> +#define MCP2221_SRAM_GP_VALUE_MASK		0x10
> +
>   /* MCP GPIO direction encoding */
>   enum {
>   	MCP2221_DIR_OUT = 0x00,
> @@ -607,6 +628,80 @@ static const struct i2c_algorithm mcp_i2c_algo = {
>   };
>   
>   #if IS_REACHABLE(CONFIG_GPIOLIB)
> +static int mcp_gpio_read_sram(struct mcp2221 *mcp)
> +{
> +	int ret;
> +
> +	memset(mcp->txbuf, 0, 64);
> +	mcp->txbuf[0] = MCP2221_GET_SRAM_SETTINGS;
> +
> +	mutex_lock(&mcp->lock);
> +	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 64);
> +	mutex_unlock(&mcp->lock);
> +
> +	return ret;
> +}
> +
> +/*
> + * If CONFIG_IIO is not enabled, check for the gpio pins
> + * if they are in gpio mode. For the ones which are not
> + * in gpio mode, set them into gpio mode.
> + */
> +static int mcp2221_check_gpio_pinfunc(struct mcp2221 *mcp)
> +{
> +	int i;
> +	int needgpiofix = 0;
> +	int ret;
> +
> +	if (IS_ENABLED(CONFIG_IIO))
> +		return 0;
> +
> +	ret = mcp_gpio_read_sram(mcp);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < MCP_NGPIO; i++) {
> +		if ((mcp->mode[i] & MCP2221_SRAM_GP_DESIGN_MASK) != 0x0) {
> +			dev_warn(&mcp->hdev->dev,
> +				 "GPIO %d not in gpio mode\n", i);
> +			needgpiofix = 1;
> +		}
> +	}
> +
> +	if (!needgpiofix)
> +		return 0;
> +
> +	/*
> +	 * Set all bytes to 0, so Bit 7 is not set. The chip
> +	 * only changes content of a register when bit 7 is set.
> +	 */
> +	memset(mcp->txbuf, 0, 64);
> +	mcp->txbuf[0] = MCP2221_SET_SRAM_SETTINGS;
> +
> +	/*
> +	 * Set bit 7 in MCP2221_SRAM_WR_GP_ENA_ALTER to enable
> +	 * loading of a new set of gpio settings to GP SRAM
> +	 */
> +	mcp->txbuf[MCP2221_SRAM_WR_GP_ENA_ALTER] = 0x80;
> +	for (i = 0; i < MCP_NGPIO; i++) {
> +		if ((mcp->mode[i] & MCP2221_SRAM_GP_DESIGN_MASK) == 0x0) {
> +			/* write current GPIO mode */
> +			mcp->txbuf[MCP2221_SRAM_WR_GP0 + i] = mcp->mode[i];
> +		} else {
> +			/* pin is not in gpio mode, set it to input mode */
> +			mcp->txbuf[MCP2221_SRAM_WR_GP0 + i] = 0x08;
> +			dev_warn(&mcp->hdev->dev,
> +				 "Set GPIO mode for gpio pin %d!\n", i);
> +		}
> +	}
> +
> +	mutex_lock(&mcp->lock);
> +	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 64);
> +	mutex_unlock(&mcp->lock);
> +
> +	return ret;
> +}
> +
>   static int mcp_gpio_get(struct gpio_chip *gc,
>   				unsigned int offset)
>   {
> @@ -1216,6 +1311,8 @@ static int mcp2221_probe(struct hid_device *hdev,
>   	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
>   	if (ret)
>   		return ret;
> +
> +	mcp2221_check_gpio_pinfunc(mcp);
>   #endif
>   
>   #if IS_REACHABLE(CONFIG_IIO)
> 

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

