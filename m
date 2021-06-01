Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BC1397BE8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 23:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234782AbhFAVxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 17:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234656AbhFAVxb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 17:53:31 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202ECC06174A
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 14:51:49 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id v13so16245ple.9
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jun 2021 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=ld1Xd1bDER42ti5r88EoRsgYUTWUaYxe7rrS5hweMVk=;
        b=SpE3sQGgwN7eUaBjbUXpg8+kPnYnpVsVxQzV49wT4YqelOuLHsRy4sbd95Gc/ju/Ut
         ReEsa7gAgjnpw5WER1BH8iYOaiNiYI52CzDRwt+oKYQCb1keupdOm/Do+2muwAeMNlD9
         0tJXiEObVI6fNMpCIasS5RewHc1CN5QRh/6bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=ld1Xd1bDER42ti5r88EoRsgYUTWUaYxe7rrS5hweMVk=;
        b=uigyHu066bzCfPE43KQ8g+ooLrhLPQk3xOFeeRtrbRD71fdj/QYHej998zvpT7aJPS
         Hy/FamP3xtytDrDDfmxZ2Mr7KczhS4+SsbWbZ1HQFH0ZOnNUhKTT4sz2s+pkb9pYzm2o
         dNPupUMBsv0/1T4HCAKIsYyVaa8sDdolV32kQdJNI01PXBk/yVfBxD/bkKXDLZM9VqHV
         SSznYcU49FAiKXPoiSxq7Wr3h7IcyC/auzlrwxh4j8o6ObjcrDeaPNcltaWjVHGKAi1z
         K1g80JUa0sOmvEKExUyuaxBVmkSYsLpMlJV6VXWPwM0xDkuswRQQ5Je7zjxRT+W3fHpG
         qGVw==
X-Gm-Message-State: AOAM531MvQETr3Si/BzP/vuzDByQ6eQLE0CBkpZwc3gKeFxz9H34VwZS
        QvaP3vjzOtr3Ln0yhoTX3IRApQ==
X-Google-Smtp-Source: ABdhPJx+6PmFo84/xJIl+9bvCTsuF6ElvlZinvDfzUVUboPmCMPcp24ciTd/E0KcdQKUkg9TRGOqEw==
X-Received: by 2002:a17:902:720c:b029:ee:f427:91e9 with SMTP id ba12-20020a170902720cb02900eef42791e9mr28052698plb.72.1622584308151;
        Tue, 01 Jun 2021 14:51:48 -0700 (PDT)
Received: from [10.136.8.240] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id g141sm14041389pfb.210.2021.06.01.14.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 14:51:47 -0700 (PDT)
Subject: Re: [PATCH] i2c: bcm-iproc: Add i2c recovery support
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Laing <Richard.Laing@alliedtelesis.co.nz>
References: <20210530225659.17138-1-chris.packham@alliedtelesis.co.nz>
 <7962c2ae-f3c6-66a4-e976-f7edbf80781c@broadcom.com>
 <3832d206-6636-80a0-6369-cc26d6083426@alliedtelesis.co.nz>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <46715939-9aa6-8c83-2433-7bebf85a49c3@broadcom.com>
Date:   Tue, 1 Jun 2021 14:51:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <3832d206-6636-80a0-6369-cc26d6083426@alliedtelesis.co.nz>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000599b5c05c3bb59dd"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000599b5c05c3bb59dd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/1/2021 2:44 PM, Chris Packham wrote:
> 
> On 2/06/21 9:03 am, Ray Jui wrote:
>>
>> On 5/30/2021 3:56 PM, Chris Packham wrote:
>>> From: Richard Laing <richard.laing@alliedtelesis.co.nz>
>>>
>>> The bcm-iproc controller can put the SDA/SCL lines into bit-bang mode,
>>> make use of this to support i2c bus recovery.
>>>
>>> Signed-off-by: Richard Laing <richard.laing@alliedtelesis.co.nz>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> Notes:
>>>      Richard did most of the work on this. I'm just cleaning it up to get it
>>>      upstream.
>>>
>>>   drivers/i2c/busses/i2c-bcm-iproc.c | 115 +++++++++++++++++++++++++++++
>>>   1 file changed, 115 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
>>> index cceaf69279a9..d63a286c1660 100644
>>> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
>>> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
>>> @@ -26,6 +26,7 @@
>>>   #define CFG_RESET_SHIFT              31
>>>   #define CFG_EN_SHIFT                 30
>>>   #define CFG_SLAVE_ADDR_0_SHIFT       28
>>> +#define CFG_BIT_BANG_SHIFT           29
>> move this up one line (to be consistent with existing bit order)
> 
> Ack.
> 
>>>   #define CFG_M_RETRY_CNT_SHIFT        16
>>>   #define CFG_M_RETRY_CNT_MASK         0x0f
>>>   
>>> @@ -66,6 +67,12 @@
>>>   #define S_FIFO_RX_THLD_SHIFT         8
>>>   #define S_FIFO_RX_THLD_MASK          0x3f
>>>   
>>> +#define M_BB_CTRL_OFFSET             0x14
>>> +#define M_BB_SMBCLK_IN               31
>> M_BB_CTRL_CLK_IN_SHIFT, ket is to have '_SHIFT' to be consistent with
>> existing code
> 
> Ack.
> 
>>> +#define M_BB_SMBCLK_OUT_EN           30
>> M_BB_CTRL_CLK_OUT_SHIFT
>>
>>> +#define M_BB_SMBDAT_IN               29
>> M_BB_CTRL_DATA_IN_SHIFT
>>
>>> +#define M_BB_SMBDAT_OUT_EN           28
>> M_BB_CTRL_DATA_OUT_SHIFT
>>
>>> +
>>>   #define M_CMD_OFFSET                 0x30
>>>   #define M_CMD_START_BUSY_SHIFT       31
>>>   #define M_CMD_STATUS_SHIFT           25
>>> @@ -713,6 +720,112 @@ static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
>>>   	iproc_i2c_wr_reg(iproc_i2c, CFG_OFFSET, val);
>>>   }
>>>   
>>> +static void bcm_iproc_i2c_reset(struct bcm_iproc_i2c_dev *iproc_i2c)
>>> +{
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(iproc_i2c->base + CFG_OFFSET);
>>> +	tmp |= BIT(CFG_RESET_SHIFT);
>>> +	writel(tmp, iproc_i2c->base + CFG_OFFSET);
>>> +	udelay(100);
>> This puts the controller in reset and hold it there, but never brings
>> the controller out of reset (bcm_iproc_i2c_init called in unprepare
>> brings the controller out of reset)
>>
>> Calling it a "reset" function is a bit misleading to me. My expectation
>> of a reset function is that you generate a reset pulse, ie.g., reset ->
>> delay -> out of reset.
>>
>> Why don't you simply put this seuquence of code in the prepare_recovery
>> function below, instead of calling this a reset function?
> 
> Will do. Should I also change the udelay(100) to a usleep_range(100, 
> 200)? Same question for the other uses of udelay().
> 

Sure I think that makes sense.

>>
>>> +
>>> +}
>>> +
>>> +static void bcm_iproc_i2c_prepare_recovery(struct i2c_adapter *adap)
>>> +{
>>> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
>>> +	u32 tmp;
>>> +
>>> +	dev_dbg(iproc_i2c->device, "Prepare recovery\n");
>>> +
>>> +	/* Disable interrupts */
>>> +	writel(0, iproc_i2c->base + IE_OFFSET);
>>> +	readl(iproc_i2c->base + IE_OFFSET);
>>> +	synchronize_irq(iproc_i2c->irq);
>>> +
>>> +	bcm_iproc_i2c_reset(iproc_i2c);
>>> +
>>> +	/* Switch to bit-bang mode */
>>> +	tmp = readl(iproc_i2c->base + CFG_OFFSET);
>>> +	tmp |= BIT(CFG_BIT_BANG_SHIFT);
>>> +	writel(tmp, iproc_i2c->base + CFG_OFFSET);
>> add usleep_range(100, 200) here, required delay after switching to bit
>> bang based on spec.
> 
> Ack.
> 
>>
>>> +}
>>> +
>>> +static void bcm_iproc_i2c_unprepare_recovery(struct i2c_adapter *adap)
>>> +{
>>> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
>>> +	u32 tmp;
>>> +
>>> +	/* Switch to normal mode */
>>> +	tmp = readl(iproc_i2c->base + CFG_OFFSET);
>>> +	tmp &= ~BIT(CFG_BIT_BANG_SHIFT);
>>> +	writel(tmp, iproc_i2c->base + CFG_OFFSET);
>>> +	udelay(100);
>>> +
>>> +	bcm_iproc_i2c_init(iproc_i2c);
>> Add sequence to re-configure to desired bus speed here after the reset
>> sequence (someone else in our team tested this is required to resume to
>> proper bus speed).
> bcm_iproc_i2c_resume() seems to have the exact sequence I need. If I 
> move it outside of CONFIG_PM_SLEEP I could just call it here.

Yes agree with you that 'bcm_iproc_i2c_resume' can be resued.

>>> +	bcm_iproc_i2c_enable_disable(iproc_i2c, true);
>>> +
>>> +	dev_dbg(iproc_i2c->device, "Recovery complete\n");
>>> +}
>>> +
>>> +static int bcm_iproc_i2c_get_scl(struct i2c_adapter *adap)
>>> +{
>>> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
>>> +
>>> +	return !!(tmp & BIT(M_BB_SMBCLK_IN));
>>> +}
>>> +
>>> +static void bcm_iproc_i2c_set_scl(struct i2c_adapter *adap, int val)
>>> +{
>>> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
>>> +	if (val)
>>> +		tmp |= BIT(M_BB_SMBCLK_OUT_EN);
>>> +	else
>>> +		tmp &= ~BIT(M_BB_SMBCLK_OUT_EN);
>>> +
>>> +	writel(tmp, iproc_i2c->base + M_BB_CTRL_OFFSET);
>>> +}
>>> +
>>> +static void bcm_iproc_i2c_set_sda(struct i2c_adapter *adap, int val)
>>> +{
>>> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
>>> +	if (val)
>>> +		tmp |= BIT(M_BB_SMBDAT_OUT_EN);
>>> +	else
>>> +		tmp &= ~BIT(M_BB_SMBDAT_OUT_EN);
>>> +
>>> +	writel(tmp, iproc_i2c->base + M_BB_CTRL_OFFSET);
>>> +}
>>> +
>>> +static int bcm_iproc_i2c_get_sda(struct i2c_adapter *adap)
>>> +{
>>> +	struct bcm_iproc_i2c_dev *iproc_i2c = i2c_get_adapdata(adap);
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl(iproc_i2c->base + M_BB_CTRL_OFFSET);
>>> +
>>> +	return !!(tmp & BIT(M_BB_SMBDAT_IN));
>>> +}
>>> +
>>> +static struct i2c_bus_recovery_info bcm_iproc_recovery_info = {
>> static const struct ...
> Ack.
>>> +	.recover_bus = i2c_generic_scl_recovery,
>>> +	.prepare_recovery = bcm_iproc_i2c_prepare_recovery,
>>> +	.unprepare_recovery = bcm_iproc_i2c_unprepare_recovery,
>>> +	.set_scl = bcm_iproc_i2c_set_scl,
>>> +	.get_scl = bcm_iproc_i2c_get_scl,
>>> +	.set_sda = bcm_iproc_i2c_set_sda,
>>> +	.get_sda = bcm_iproc_i2c_get_sda,
>>> +};
>>> +
>>>   static int bcm_iproc_i2c_check_status(struct bcm_iproc_i2c_dev *iproc_i2c,
>>>   				      struct i2c_msg *msg)
>>>   {
>>> @@ -839,6 +952,7 @@ static int bcm_iproc_i2c_xfer_internal(struct bcm_iproc_i2c_dev *iproc_i2c,
>>>   	if (!!(iproc_i2c_rd_reg(iproc_i2c,
>>>   				M_CMD_OFFSET) & BIT(M_CMD_START_BUSY_SHIFT))) {
>>>   		dev_warn(iproc_i2c->device, "bus is busy\n");
>>> +		i2c_recover_bus(&iproc_i2c->adapter);
>> 'i2c_recover_bus' should not be ALWAYS called here. You don't know if
>> bus is actually locked up or it's other issues that caused this.
>>
>> We need a logic to detect and confirm the lock up condition before
>> committing to recover operation:
>>
>> /* Check if bus lockup occurred, and invoke recovery if so. */
>> static void iproc_i2c_lockup_recover(struct bcm_iproc_i2c_dev *iproc_i2c)
>> {
>> 	/*
>> 	 * assume bus lockup if SDA line is low;
>> 	 * note that there is no need to switch to
>> 	 * bit-bang mode for this check.
>> 	 */
>> 	if (!bcm_iproc_i2c_get_sda(&iproc_i2c->adapter)) {
>> 		/* locked up - invoke i2c bus recovery. */
>> 		int ret = i2c_recover_bus(&iproc_i2c->adapter);
>> 			if (ret)
>> 				dev_err(iproc_i2c->device,
>> 					"bus recovery: error %d\n",
>> 					ret);
>> 	}
>> }
>>
>> 'iproc_i2c_lockup_recover' should be called in two locations in the driver:
>>
>> 1. After 'transaction timed out' (and after flush both TX/RX FIFOS)
>> 2. After 'bcm_iproc_i2c_check_status' failures (and after flush both
>> TX/RX FIFOs).
> 
> I see bcm_iproc_i2c_check_status() has a "recovery" case on an unknown 
> error. Should I remove that if I'm going to call 
> iproc_i2c_lockup_recover() or check for ret != -EIO?
> 

You may leave that (as first level recovery due to some potential
internal ASIC issues).

Let iproc_i2c_lockup_recover handles the bus lockup type of recovery
(after confirming the bus is indeed locked up).

>>
>>>   		return -EBUSY;
>>>   	}
>>>   
>>> @@ -1111,6 +1225,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>>>   		of_node_full_name(iproc_i2c->device->of_node));
>>>   	adap->algo = &bcm_iproc_algo;
>>>   	adap->quirks = &bcm_iproc_i2c_quirks;
>>> +	adap->bus_recovery_info = &bcm_iproc_recovery_info;
>>>   	adap->dev.parent = &pdev->dev;
>>>   	adap->dev.of_node = pdev->dev.of_node;
>>>   
>>>
>> Thanks,
>>
>> Ray

--000000000000599b5c05c3bb59dd
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Pi3DQoJNNR5cV1dw3cNMKQyHRziEjFTVmILshClu9AljdXzCUoHXDUbge8TIJ/fK36qTGCYWwA01
rTB3drVX3FZq/Uqo0JnVcyP1dtYVzQIDAQABo4IB1TCCAdEwDgYDVR0PAQH/BAQDAgWgMIGjBggr
BgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9j
YWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8v
b2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBE
MEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20v
cmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2Jh
bHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAfBgNVHREEGDAWgRRyYXku
anVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdb
NHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU5E1VdIocTRYIpXh6e6OnGvwfrEgwDQYJKoZIhvcNAQEL
BQADggEBADcZteuA4mZVmXNzp/tJky+9TS87L/xAogg4z+0bFDomA2JdNGKjraV7jE3LKHUyCQzU
Bvp8xXjxCndLBgltr+2Fn/Dna/f29iAs4mPBxgPKhqnqpQuTo2DLID2LWU1SLI9ewIlROY57UCvO
B6ni+9NcOot0MbKF2A1TnzJjWyd127CVyU5vL3un1/tbtmjiT4Ku8ZDoBEViuuWyhdB6TTEQiwDo
2NxZdezRkkkq+RoNek6gmtl8IKmXsmr1dKIsRBtLQ0xu+kdX+zYJbAQymI1mkq8qCmFAe5aJkrNM
NbsYBZGZlcox4dHWayCpn4sK+41xyJsmGrygY3zghqBuHPUxggJtMIICaQIBATBrMFsxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdD
QyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxnTAexrtwIst251kUwDQYJYIZIAWUDBAIBBQCg
gdQwLwYJKoZIhvcNAQkEMSIEICSd1/Mf5+yAEefL/av9YPh915LSXYi0fqc/Fv6onVhDMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDYwMTIxNTE0OFowaQYJKoZI
hvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEF
AASCAQAfWFcdZpZDleGzSYdwbCqdeTSXG+uVgVJCLj2/obkEtvHDIM9FVWC1L8kD+eM0fs1wjx8/
Dk0W59fWRv5oDQSCWP/MTp4vbJPOZQYzCmx44FTRMMvfYbI2SnW4wc86HhAwWe+IdFDnA0YIbgx+
Sg3rx0I4dw008xQTzwj6U3b/FyIobiURO5C2/2qMT6Mth37eZAqru/5CZMzksbr/yTmJZHWrrrwm
Q0/uypLVd5u5mXGxN1I8coJRPuo9U6tGLKLYrlmzi4AXaKRxq3TiDhy052gwCVSObW+qTwxrqQJr
UwUWjG93TUc9hfhRBfiR1yWFuWGWI9uBg9KE/A4Twt+N
--000000000000599b5c05c3bb59dd--
