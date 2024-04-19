Return-Path: <linux-i2c+bounces-3023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D518AAE88
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 14:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A017281FE4
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 12:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827147F46C;
	Fri, 19 Apr 2024 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0VqTJAX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58B389;
	Fri, 19 Apr 2024 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713530004; cv=none; b=M1wqEljH+JwIhVpKjCBODKAtyXxBUCT2bz1dqd972viCiAwhYCJ66rLtMHM+SG2zd3E6nK3XJ5+iUmT6dLnc5GBCCe+bZlE3o2wV28ZkKEKhnzPLJbRXpMgaCJ5z+gRkGJ/gqBTLiR2xu/SZOp4G3dXFA4q/S2vDmUNE9NldJQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713530004; c=relaxed/simple;
	bh=StnmeusMQF53D5OVIcXegM418o2scr3U54D6nPiuTWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agOygI2J9h55yX4W5EVY6FzVSoGCP6pyldt2jv9yQrgt+bcHxM9MahiFiqqWt1NYbxGmOHblqDXIrSq5+VELkB/XQwb1xRGKDeHWdCzOMb5qQbKuxGRwhJ03WlpGeBYFztm4BpbCsnr48H+3NqxxjYkUGwcKysyO+m2psTS81Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0VqTJAX; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a2dd2221d3so1675787a91.0;
        Fri, 19 Apr 2024 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713530002; x=1714134802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITHpHbc4Q5oTHm0pw/lm1Dwc7jn1b2wnohPusS4F1Vg=;
        b=h0VqTJAXy9jMZXgnyKdMmM0rb8DJPs6RTRwNHurZ4fDYlaIxg8C1stefnEP3uJOhcb
         PV/vPTeSY5VKZbuW3ms8SNR3JyWcffuiRV7Ygn3D1qMlYJRq7r6S7HqmdlZTEjpzsx21
         R1IUj+szazMCoN2MXfPO4Er9LWm4D68GQCgsemQEBMWfowQRxZ2fpH7Mx9mtvlC/8r/B
         S6Nlrw5g3G1NRcub4/ASXRZcCvvoplA7fR2JHPB0X8TSmpRup2z9DROzrKqO84dUb/IT
         YOySB/zvnO5nADksn0RjWRbMBvX+Jk5d1OPKrDGCwGjDLyfPSl5BQka61iWOFO+sWuUU
         YB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713530002; x=1714134802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITHpHbc4Q5oTHm0pw/lm1Dwc7jn1b2wnohPusS4F1Vg=;
        b=BQ9Do87Wq5/OFi6XLXpHI5oTCB9s4xkj50X21VBkxj/iyyHf/Hj/K8SplhQxp1mr2e
         tWj7DWc2XCUIhUe2VN4n8g1Eowayoiktca5y7xP5kgaGlCPNcXaW9mnRg1W4dAwTtsDU
         6DzHb4RLtAH7GNloZRQVPsrK5NszTVYGtEzAL7DHQXtvcoEi5zURNKesAZkB2VjB6wqK
         bQjcgdxEtGGtuB6TCI0ngCebLob8f/r6aAt5408Wu2yY/GdyXSMmG/3oD24BfR5EOv2B
         3xjqHvfqw4rVsjll2hzl1hG0MHCzsEqYNAOFc/0rfuFu3rAFO/hmSWdhvs0mtTrQ/xE8
         VqEA==
X-Forwarded-Encrypted: i=1; AJvYcCVYhJuNbsr4Sh4sSySHpTQ621v6b3zgkakAPOZPGB7y45vvEnS3tIo1y2uBDhMLtUVEZzq0uMZ9A5l/pu1vhTnu2uCik6ZdZH1FK4Qj7EQku7NdQFmjTT6Puj5B1kkoMumtvLqPKAZZJLhKPmMAM8GN0Cp+BoNstX/a9J9LLVt6K9vNbp5LeozSUO/APN9/ftPANvqo8nAV3s3Xk0/HsA==
X-Gm-Message-State: AOJu0YxEtleix4EHajfiFyaQ680Du7qXTrTvCj7pMvEl6+PgVNeomhOF
	flC+zOYXjesGqLZendC28PbA5BO5pFfxTNb6fj2t9JUZO6MehrcG
X-Google-Smtp-Source: AGHT+IHeCzIwtleEy91tXb4pgb8RHsB52psYxgTyuwMubElgI28+ShrWaqpc1Ut5yGf+02wCRd9Mog==
X-Received: by 2002:a17:90a:ce09:b0:2a2:34d8:ddeb with SMTP id f9-20020a17090ace0900b002a234d8ddebmr1898981pju.22.1713530001721;
        Fri, 19 Apr 2024 05:33:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a13-20020a17090abe0d00b002a04eef22c5sm3015734pjs.44.2024.04.19.05.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:33:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Apr 2024 05:33:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "SanBuenaventura, Jose" <Jose.SanBuenaventura@analog.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Message-ID: <902d73a2-e46a-4f60-bde2-3badc46863da@roeck-us.net>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
 <20240417000722.919-3-jose.sanbuenaventura@analog.com>
 <b36db2c0-db31-4304-8e58-aa358ab811c5@roeck-us.net>
 <62f878f4-a4fb-4e3c-8eec-d1be5ba165a4@roeck-us.net>
 <PH0PR03MB66070CAE5E8D99158003D58FEC0E2@PH0PR03MB6607.namprd03.prod.outlook.com>
 <1221f2fd-758e-4c10-8551-ed571fb1577f@roeck-us.net>
 <SJ0PR03MB66008186E17D3920B5B58B92EC0D2@SJ0PR03MB6600.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR03MB66008186E17D3920B5B58B92EC0D2@SJ0PR03MB6600.namprd03.prod.outlook.com>

On Fri, Apr 19, 2024 at 02:46:15AM +0000, SanBuenaventura, Jose wrote:
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Thursday, April 18, 2024 7:55 PM
> > To: SanBuenaventura, Jose <Jose.SanBuenaventura@analog.com>
> > Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-doc@vger.kernel.org; linux-i2c@vger.kernel.org;
> > Jean Delvare <jdelvare@suse.com>; Rob Herring <robh@kernel.org>;
> > Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Delphine CC
> > Chiu <Delphine_CC_Chiu@wiwynn.com>
> > Subject: Re: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
> > 
> > [External]
> > 
> > On Thu, Apr 18, 2024 at 08:31:42AM +0000, SanBuenaventura, Jose wrote:
> > >
> > > The lines mentioned were added initially because the STATUS_CML read
> > capability
> > > seems to be only available in the adm1281 and so reading the said register
> > with
> > > another device shouldn't be permitted.
> >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > Why ? Sure, doing so causes the CML bit to be set, but the PMBus core uses
> > that method throughout to determine if a command/register is supported.
> > There are exceptions - some chips react badly if an attempt is made to read
> > unsupported registers. That is not the case for chips in this series, at
> > least not for the ones where I have evaluation boards. In such cases,
> > the chip driver should do nothing and let the PMBus core do its job.
> > 
> > > It seems though that the functionality is redundant and is already handled
> > by
> > > the PMBus core and maybe these lines can be removed and CML related
> > errors
> > > can be checked using the status0 and status0_cml debugfs entries.
> > 
> > This has nothing to do with status0 and status0_cml debugfs entries. The
> > PMBUs core reads STATUS_CML if the CML status bit is set in the status
> > byte/word to determine if a command is supported or not. This is as
> > intended. There is nothing special to be done by a chip driver.
> > 
> > Thanks,
> > Guenter
> 
> Based on the feedback, it seems that the lines mentioned can be removed since
> the pmbus_core.c handles the checking of status_cml through different functions
> like pmbus_check_status_cml and pmbus_check_register among others.
> 
> One thing we observed in the pmbus_core is that the invalid command flag was the
> only one being utilized (PB_CML_FAULT_INVALID_COMMAND) but there are other
> flags for cml fault in pmbus.h such as PB_CML_FAULT_PROCESSOR or 
> PB_CML_FAULT_PACKET_ERROR that were not used. 
> 
> Given these observations, it would again seem right to eliminate the lines you 
> pointed out since those items are already handled by the pmbus core and that
> the status0_cml debugfs entry can be probed to check the register content directly
> and see if there's any other cml fault aside from the invalid command that occurs
> and the user can address it accordingly.
> 
> If ever there would be changes to address the other cml fault errors aside from the
> invalid command it seems that the changes should be applied in the pmbus core 
> and not on the chip driver itself.
> 
> I hope that I understood correctly the points you brought up and identified the 
> possible next step to address those which is to eliminate the added case in the 
> adm1275_read_byte_data.
> 
Correct.

Thanks,
Guenter

