Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B687226347
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jul 2020 17:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgGTP1c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jul 2020 11:27:32 -0400
Received: from gateway20.websitewelcome.com ([192.185.52.45]:12783 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726030AbgGTP1b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jul 2020 11:27:31 -0400
X-Greylist: delayed 1328 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Jul 2020 11:27:30 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 65F1B40117E69
        for <linux-i2c@vger.kernel.org>; Mon, 20 Jul 2020 08:43:17 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id xXLkjCTTXzOauxXLkj5R6L; Mon, 20 Jul 2020 10:05:04 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WIjggXUy7GcDd3xDRIJ/WPhD4riCs9JcTnEsxbVIO8E=; b=iJ/gop5prkKiTLIrDBZAouL8ZV
        CxRQdc3x8Vi1cEOfl94gMhNpCduf4l1IjTGSijcygNjTYs37I46LuoV0CZoP3rRM1zwH2seGLlXEh
        YZ5IPW0SNPW1+iqpYeF4VSgV6rhZ6aSfVz5CCONhgAPGqg6O56jva8IOQYuLa/Y3n+lqSlb4fzSEl
        nq2vwaG8lGOcgm3d2VfqN4p0gCvOsOVorMXwD5SKIx0N3OpUr+zXUh8VXfSLc50i2Qjz/QgDFv1jn
        9wiY8gjeAT3yxSS00YBd2j0FRDhMW1JKDQPUQ5dmWcx0VWWa+jiX4FxpFpfJiRePb6sQbVnGaYpH6
        3j1WKsRQ==;
Received: from [200.68.140.17] (port=24009 helo=[192.168.43.132])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jxXLk-0044Ne-D8; Mon, 20 Jul 2020 10:05:04 -0500
Subject: Re: [PATCH][next] i2c: busses: Use fallthrough pseudo-keyword
To:     Jean Delvare <jdelvare@suse.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200716220307.GA19706@embeddedor>
 <20200720165938.31bb6b10@endymion>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 AP7RWS474w==
Message-ID: <b2caf3e8-7efe-96d7-045a-19a52132ca84@embeddedor.com>
Date:   Mon, 20 Jul 2020 10:10:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200720165938.31bb6b10@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.17
X-Source-L: No
X-Exim-ID: 1jxXLk-0044Ne-D8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.132]) [200.68.140.17]:24009
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 7/20/20 09:59, Jean Delvare wrote:
> Hi Gustavo,
> 
> On Thu, 16 Jul 2020 17:03:07 -0500, Gustavo A. R. Silva wrote:
>> Replace the existing /* fall through */ comments and its variants with
>> the new pseudo-keyword macro fallthrough[1].
>>
>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>  drivers/i2c/busses/i2c-amd8111.c | 2 +-
>>  drivers/i2c/busses/i2c-i801.c    | 8 ++++----
>>  drivers/i2c/busses/i2c-viapro.c  | 2 +-
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-amd8111.c b/drivers/i2c/busses/i2c-amd8111.c
>> index 2b14fef5bf26..34862ad3423e 100644
>> --- a/drivers/i2c/busses/i2c-amd8111.c
>> +++ b/drivers/i2c/busses/i2c-amd8111.c
>> @@ -381,7 +381,7 @@ static s32 amd8111_access(struct i2c_adapter * adap, u16 addr,
>>  			if (status)
>>  				return status;
>>  			len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
>> -			/* fall through */
>> +			fallthrough;
>>  		case I2C_SMBUS_I2C_BLOCK_DATA:
>>  			for (i = 0; i < len; i++) {
>>  				status = amd_ec_read(smbus, AMD_SMB_DATA + i,
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 1fc7ae77753d..638e7f7c66cc 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1765,19 +1765,19 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS1:
>>  	case PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS_MS2:
>>  		priv->features |= FEATURE_IDF;
>> -		/* fall through */
>> +		fallthrough;
>>  	default:
>>  		priv->features |= FEATURE_BLOCK_PROC;
>>  		priv->features |= FEATURE_I2C_BLOCK_READ;
>>  		priv->features |= FEATURE_IRQ;
>> -		/* fall through */
>> +		fallthrough;
>>  	case PCI_DEVICE_ID_INTEL_82801DB_3:
>>  		priv->features |= FEATURE_SMBUS_PEC;
>>  		priv->features |= FEATURE_BLOCK_BUFFER;
>> -		/* fall through */
>> +		fallthrough;
>>  	case PCI_DEVICE_ID_INTEL_82801CA_3:
>>  		priv->features |= FEATURE_HOST_NOTIFY;
>> -		/* fall through */
>> +		fallthrough;
>>  	case PCI_DEVICE_ID_INTEL_82801BA_2:
>>  	case PCI_DEVICE_ID_INTEL_82801AB_3:
>>  	case PCI_DEVICE_ID_INTEL_82801AA_3:
>> diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
>> index 05aa92a3fbe0..970ccdcbb889 100644
>> --- a/drivers/i2c/busses/i2c-viapro.c
>> +++ b/drivers/i2c/busses/i2c-viapro.c
>> @@ -228,7 +228,7 @@ static s32 vt596_access(struct i2c_adapter *adap, u16 addr,
>>  			goto exit_unsupported;
>>  		if (read_write == I2C_SMBUS_READ)
>>  			outb_p(data->block[0], SMBHSTDAT0);
>> -		/* Fall through */
>> +		fallthrough;
>>  	case I2C_SMBUS_BLOCK_DATA:
>>  		outb_p(command, SMBHSTCMD);
>>  		if (read_write == I2C_SMBUS_WRITE) {
> 
> Looks good to me, thanks for doing that.
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 

Thanks for this.

> However I see many occurrences in other drivers within
> drivers/i2c/busses, which are not covered by this patch:
> 
> drivers/i2c/busses/i2c-designware-pcidrv.c
> drivers/i2c/busses/i2c-mv64xxx.c
> drivers/i2c/busses/i2c-omap.c
> drivers/i2c/busses/i2c-synquacer.c
> drivers/i2c/busses/i2c-ibm_iic.c
> drivers/i2c/busses/i2c-aspeed.c
> drivers/i2c/busses/scx200_acb.c
> drivers/i2c/busses/i2c-digicolor.c
> drivers/i2c/busses/i2c-opal.c
> 
> Are they covered by another patch of yours?
> 

Yep; I have a queue of pending patches I'm about to send. :)

Thanks
--
Gustavo
