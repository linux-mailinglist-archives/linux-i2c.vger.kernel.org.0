Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41585F23DE
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 17:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJBP3t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 11:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJBP3s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 11:29:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9811181C;
        Sun,  2 Oct 2022 08:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1664724518;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=JWaP7RXZDEtgcqRu/s9q3WTfPXKc6f9i74iz5nGjJPc=;
    b=CGFGhcp8+RAa84aBp3Cyg9erg1Sk0U8WY+7shWOeJQo3z6FfOeMZe9xwZQVy3XXKbz
    L+ghPmGdGHIjflXx0xJCjVTtV7BiMEC6wq92dd4V81FO56/xfSeZRYVmi1q7T3nFtOHZ
    6Mj2Tz5RvWXmhZrZ4WjyyPJIFoDXlzt/ajYmx42xUkUkb2cjpZi2/v5Wa887hT7IaTsF
    3LLxlCgJfwmRpIcQ7LrgL2pp0LQBIjC1rie0xlnu4sihKrDo+DxXWD6ftl/QS2e0fjeZ
    q/3uKk9CFl8BtLq69ccv3rHGIYG3eL+rtzRrug5NfWdKwI3BB36rbpnolXHWLkEWme+T
    gAAw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiB6Ms880YXt4vX4K4IwSOGijZEpA=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:d15d:b942:40c7:5459]
    by smtp.strato.de (RZmta 48.1.3 AUTH)
    with ESMTPSA id 4958bfy92FSZDBv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 2 Oct 2022 17:28:35 +0200 (CEST)
Message-ID: <1ad42694-a002-2108-37b5-ffcd8f08d442@xenosoft.de>
Date:   Sun, 2 Oct 2022 17:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2] i2c/pasemi: PASemi I2C controller IRQ enablement
To:     Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Sven Peter <sven@svenpeter.dev>,
        Hector Martin <marcan@marcan.st>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Darren Stevens <darren@stevens-zone.net>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Christian Zigotzky <info@xenosoft.de>
References: <MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02 October 2022 at 00:25 am, Arminder Singh wrote:
> Hello,
>
> This is v2 of the PASemi I2C controller IRQ enablement patch.
>
> This patch adds IRQ support to the PASemi I2C controller driver to
> increase the performace of I2C transactions on platforms with PASemi I2C
> controllers. While the patch is primarily intended for Apple silicon
> platforms, this patch should also help in enabling IRQ support for
> older PASemi hardware as well should the need arise.
>
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>
> Tested-by: Arminder Singh <arminders208@outlook.com>
> Signed-off-by: Arminder Singh <arminders208@outlook.com>
> ---
> Changes from v1:
>   - moved completion setup from pasemi_platform_i2c_probe to
>     pasemi_i2c_common_probe to allow PASemi and Apple platforms to share
>     common completion setup code in case PASemi hardware gets IRQ support
>     added
>   - initialized the status variable in pasemi_smb_waitready when going down
>     the non-IRQ path
>   - removed an unnecessary cast of dev_id in the IRQ handler
>   - fixed alignment of struct member names in i2c-pasemi-core.h
>     (addresses Christophe's feedback in the original submission)
>   - IRQs are now disabled after the wait_for_completion_timeout call
>     instead of inside the IRQ handler
>     (prevents the IRQ from going off after the completion times out)
>   - changed the request_irq call to a devm_request_irq call to obviate
>     the need for a remove function and a free_irq call
>     (thanks to Sven for pointing this out in the original submission)
>   - added a reinit_completion call to pasemi_reset
>     as a failsafe to prevent missed interrupts from causing the completion
>     to never complete (thanks to Arnd Bergmann for pointing this out)
>   - removed the bitmask variable in favor of just using the value
>     directly (it wasn't used anywhere else)
>
> v1 linked here: https://lore.kernel.org/linux-i2c/MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com/T/#m11b3504c2667517aad7521514c99ca0e07a9381f
>
> Thanks for all the feedback on the previous submission, I'm sorry
> I wasn't able to answer everyone's emails, was just pretty busy, I'll
> make sure to be more responsive this time around! Also wasn't sure whether
> the v1 changelog belonged before or after the '---' so I put it after
> to keep the commit changelog short and concise.
> (This is just one patch, didn't think it needed a cover letter)
>
>   drivers/i2c/busses/i2c-pasemi-core.c     | 29 ++++++++++++++++++++----
>   drivers/i2c/busses/i2c-pasemi-core.h     |  7 +++++-
>   drivers/i2c/busses/i2c-pasemi-platform.c |  6 +++++
>   3 files changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index 9028ffb58cc0..05af8f3575bc 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -21,6 +21,7 @@
>   #define REG_MTXFIFO	0x00
>   #define REG_MRXFIFO	0x04
>   #define REG_SMSTA	0x14
> +#define REG_IMASK   0x18
>   #define REG_CTL		0x1c
>   #define REG_REV		0x28
>   
> @@ -66,6 +67,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
>   		val |= CTL_EN;
>   
>   	reg_write(smbus, REG_CTL, val);
> +	reinit_completion(&smbus->irq_completion);
>   }
>   
>   static void pasemi_smb_clear(struct pasemi_smbus *smbus)
> @@ -81,11 +83,18 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>   	int timeout = 10;
>   	unsigned int status;
>   
> -	status = reg_read(smbus, REG_SMSTA);
> -
> -	while (!(status & SMSTA_XEN) && timeout--) {
> -		msleep(1);
> +	if (smbus->use_irq) {
> +		reinit_completion(&smbus->irq_completion);
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> +		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
> +		reg_write(smbus, REG_IMASK, 0);
>   		status = reg_read(smbus, REG_SMSTA);
> +	} else {
> +		status = reg_read(smbus, REG_SMSTA);
> +		while (!(status & SMSTA_XEN) && timeout--) {
> +			msleep(1);
> +			status = reg_read(smbus, REG_SMSTA);
> +		}
>   	}
>   
>   	/* Got NACK? */
> @@ -344,10 +353,14 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
>   
>   	/* set up the sysfs linkage to our parent device */
>   	smbus->adapter.dev.parent = smbus->dev;
> +	smbus->use_irq = 0;
> +	init_completion(&smbus->irq_completion);
>   
>   	if (smbus->hw_rev != PASEMI_HW_REV_PCI)
>   		smbus->hw_rev = reg_read(smbus, REG_REV);
>   
> +	reg_write(smbus, REG_IMASK, 0);
> +
>   	pasemi_reset(smbus);
>   
>   	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
> @@ -356,3 +369,11 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
>   
>   	return 0;
>   }
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> +{
> +	struct pasemi_smbus *smbus = dev_id;
> +
> +	complete(&smbus->irq_completion);
> +	return IRQ_HANDLED;
> +}
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
> index 4655124a37f3..ba6d6ccf9cdc 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.h
> +++ b/drivers/i2c/busses/i2c-pasemi-core.h
> @@ -7,6 +7,7 @@
>   #include <linux/i2c-smbus.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/completion.h>
>   
>   #define PASEMI_HW_REV_PCI -1
>   
> @@ -15,7 +16,11 @@ struct pasemi_smbus {
>   	struct i2c_adapter	 adapter;
>   	void __iomem		*ioaddr;
>   	unsigned int		 clk_div;
> -	int			 hw_rev;
> +	int			         hw_rev;
> +	int                  use_irq;
> +	struct completion    irq_completion;
>   };
>   
>   int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id);
> diff --git a/drivers/i2c/busses/i2c-pasemi-platform.c b/drivers/i2c/busses/i2c-pasemi-platform.c
> index 88a54aaf7e3c..e35945a91dbe 100644
> --- a/drivers/i2c/busses/i2c-pasemi-platform.c
> +++ b/drivers/i2c/busses/i2c-pasemi-platform.c
> @@ -49,6 +49,7 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
>   	struct pasemi_smbus *smbus;
>   	u32 frequency;
>   	int error;
> +	int irq_num;
>   
>   	data = devm_kzalloc(dev, sizeof(struct pasemi_platform_i2c_data),
>   			    GFP_KERNEL);
> @@ -82,6 +83,11 @@ static int pasemi_platform_i2c_probe(struct platform_device *pdev)
>   	if (error)
>   		goto out_clk_disable;
>   
> +	irq_num = platform_get_irq(pdev, 0);
> +	error = devm_request_irq(smbus->dev, irq_num, pasemi_irq_handler, 0, "pasemi_apple_i2c", (void *)smbus);
> +
> +	if (!error)
> +		smbus->use_irq = 1;
>   	platform_set_drvdata(pdev, data);
>   
>   	return 0;

Tested-by: Christian Zigotzky <chzigotzky at xenosoft.de>

on an A-EON AmigaOne X1000 with a PASemi PWRficient PA6T-1682 processor.


