Return-Path: <linux-i2c+bounces-683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 136E280A224
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 12:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4527281877
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 11:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1DD1B26D;
	Fri,  8 Dec 2023 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=scram.de header.i=@scram.de header.b="OgcexWGU"
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 916 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 08 Dec 2023 03:27:34 PST
Received: from esg.nwe.de (esg.nwe.de [195.226.126.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301BA10CF
	for <linux-i2c@vger.kernel.org>; Fri,  8 Dec 2023 03:27:34 -0800 (PST)
X-ASG-Debug-ID: 1702033934-1ed71d5dc8174fa10001-PT6Irj
Received: from mail.scram.de ([213.206.175.31]) by esg.nwe.de with ESMTP id FtJNBH7NCVyVmvNv (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 08 Dec 2023 12:12:14 +0100 (CET)
X-Barracuda-Envelope-From: jochen@scram.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.206.175.31]
X-Barracuda-Apparent-Source-IP: 213.206.175.31
Received: (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender)
	by mail.scram.de (Postfix) with ESMTPSA id F1F218A7031;
	Fri,  8 Dec 2023 12:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.scram.de F1F218A7031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scram.de;
	s=mail2021; t=1702033934;
	bh=s9yrExIa366dn3S+pFGBrRwPq6geDOwSJ/tc3OqUeD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OgcexWGUSpSg89Uyju9wzf1zesFDFmj3KHKrqKaOzOH4JVPRVn1mj1zH471YFcm8a
	 q0tu5GgkxvUm0dACo27WH6zWOD+KeHMI3Lp0XpkutPCKt1sCLpLmilXR5TNBwv6L0M
	 uUthIG4o4C6QUmbwZn6jNgGvBuL682o804l6WyDc=
Message-ID: <950ac94b-f488-4879-973e-4014f224c62f@scram.de>
Date: Fri, 8 Dec 2023 12:12:13 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andi Shyti <andi.shyti@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
From: Jochen Friedrich <jochen@scram.de>
In-Reply-To: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Barracuda-Connect: UNKNOWN[213.206.175.31]
X-Barracuda-Start-Time: 1702033934
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://195.226.126.84:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at nwe.de
X-Barracuda-Scan-Msg-Size: 1290
X-Barracuda-BRTS-Status: 0
X-Barracuda-Spam-Score: 0.40
X-Barracuda-Spam-Status: No, SCORE=0.40 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=5.0 tests=BSF_SC0_SA085b
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.117807
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.40 BSF_SC0_SA085b         Custom Rule SA085b

Acked-By: Jochen Friedrich <jochen@scram.de>

Am 06.12.2023 um 23:24 schrieb Christophe Leroy:
> sparse reports an error on some data that gets converted from be32.
>
> That's because that data is typed u32 instead of __be32.
>
> The type is correct, the be32_to_cpu() conversion is not.
>
> Remove the conversion.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@intel.com/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Use u32 directly, remove be32_to_cpu().
> ---
>   drivers/i2c/busses/i2c-cpm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 9a664abf734d..771d60bc8d71 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -658,7 +658,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
>   	/* register new adapter to i2c module... */
>   
>   	data = of_get_property(ofdev->dev.of_node, "linux,i2c-index", &len);
> -	cpm->adap.nr = (data && len == 4) ? be32_to_cpup(data) : -1;
> +	cpm->adap.nr = (data && len == 4) ? *data : -1;
>   	result = i2c_add_numbered_adapter(&cpm->adap);
>   
>   	if (result < 0)

