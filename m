Return-Path: <linux-i2c+bounces-10201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A348A7F329
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 05:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D98D16ECAE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 03:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7619825EF93;
	Tue,  8 Apr 2025 03:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="DIPsDAnl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41EE4A1E;
	Tue,  8 Apr 2025 03:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744082920; cv=none; b=Altzdu4aNj06C0Nv04HJpt8iyWc9glUfFmD2V8E/ai3ff56tRJqhRGU1Pna3VfJP4oU/Se7W4V7as6MwHmo1TV9Po4fpoMxj/agMKk+renbmyhRLY5pK6G4sLGAFnIOPD1NAqGfS/2etU2xTbm4VVsl++M/iMlAzwci+imcXv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744082920; c=relaxed/simple;
	bh=NhUqRHGXvznjLxV6/mpyO20W9nTF5RCj2oU+Gi6q32g=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rsxV80Dtm/lAdetnchcG6Er0aD+tey2FRqJkU9sDNhWyoypcyhdKI+kKiCw/r56L6+8CKoePyJnGnaz6g9UmAMsqlPWmAab8GHh4plrn0/2SaM8QKMhSeTByDVw+KcdTlm/TjzmcFeSTj09NNNQckSX3RL+GmnA5Nc8XHfLSy+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=DIPsDAnl; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1744082918; x=1775618918;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NhUqRHGXvznjLxV6/mpyO20W9nTF5RCj2oU+Gi6q32g=;
  b=DIPsDAnlBQloXF49967YZ34E3czPCloLeb9LaBmeWK892FJdroXqIWws
   2UwDEUsK3REDNvjqpjW5hQ/ikJvqUpPdGTwxWXzQkQQAA0hcyYE7/4ACu
   4uQ277wYtZudKXISaexu05NfNyCIsrvtc8KnHeZ2F5g7nMTpnGksJ9tHb
   Y=;
X-CSE-ConnectionGUID: xg05KNqeTEKSkLs9bsiP5A==
X-CSE-MsgGUID: z4qFc0OtQ4u++L8lCaL78g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="107247366"
X-IronPort-AV: E=Sophos;i="6.15,196,1739833200"; 
   d="scan'208";a="107247366"
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 05:28:35 +0200
Received: from MUCSE808.infineon.com (172.23.29.34) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.39; Tue, 8 Apr
 2025 05:28:35 +0200
Received: from MUCSE839.infineon.com (172.23.7.112) by MUCSE808.infineon.com
 (172.23.29.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.39; Tue, 8 Apr
 2025 05:28:35 +0200
Received: from MUCSE839.infineon.com ([fe80::e04:7b92:8020:5ebd]) by
 MUCSE839.infineon.com ([fe80::e04:7b92:8020:5ebd%11]) with mapi id
 15.02.1258.039; Tue, 8 Apr 2025 05:28:35 +0200
From: <Ashish.Yadav@infineon.com>
To: <linux@roeck-us.net>, <wsa+renesas@sang-engineering.com>,
	<Shirley.Lin@infineon.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <jdelvare@suse.com>, <corbet@lwn.net>,
	<patrick.rudolph@9elements.com>, <bhelgaas@google.com>,
	<ninad@linux.ibm.com>, <festevam@denx.de>, <devicetree@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<Mills.Liu@infineon.com>, <Ian.Fang@infineon.com>
Subject: RE: Update driver xdpe152c4.c
Thread-Topic: Update driver xdpe152c4.c
Thread-Index: AduncG4+KOQ8tLMYRdSyF3hlAwcSUwAAz8qAABBIAQAAATWmAAAe7QAw
Date: Tue, 8 Apr 2025 03:28:35 +0000
Message-ID: <c8b9aa8e579e4892a35542f59cff44e4@infineon.com>
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
 <Z_NteUAIeuDdDPls@shikoro>
 <69c8cf7c-b334-4f13-ba36-a2248686b419@roeck-us.net>
 <3df0bfff-413d-4ad5-a3a8-39a7bb7a90ba@roeck-us.net>
In-Reply-To: <3df0bfff-413d-4ad5-a3a8-39a7bb7a90ba@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Guenter, Wolfram and Mukesh,=20

I hope you are doing well.
Thanks for your suggestion/feedback.=20

Sorry for the inconvenience.
This patch is still in the testing phase and not the final one, that is why=
  " pr_warn()" is used for debug purposes.=20

We will get back to you with the final patch with proper process as suggest=
ed by you.=20

With Best Regards
   Ashish Yadav


-----Original Message-----
From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
Sent: 07 April 2025 20:06
To: Wolfram Sang <wsa+renesas@sang-engineering.com>; Lin Shirley (SMD C3 GC=
 TM DCO) <Shirley.Lin@infineon.com>; robh@kernel.org; krzk+dt@kernel.org; c=
onor+dt@kernel.org; jdelvare@suse.com; corbet@lwn.net; patrick.rudolph@9ele=
ments.com; bhelgaas@google.com; ninad@linux.ibm.com; festevam@denx.de; devi=
cetree@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-i2c@vger.kernel.=
org; Liu Mills (SMD C3 GC TM DCO) <Mills.Liu@infineon.com>; Yadav Ashish (P=
SS PCS RD FW HD) <Ashish.Yadav@infineon.com>; Fang Ian (SMD C3 GC TM DCO) <=
Ian.Fang@infineon.com>
Subject: Re: Update driver xdpe152c4.c

Caution: This e-mail originated outside Infineon Technologies. Please be ca=
utious when sharing information or opening attachments especially from unkn=
own senders. Refer to our intranet guide<https://intranet-content.infineon.=
com/explore/aboutinfineon/rules/informationsecurity/ug/SocialEngineering/Pa=
ges/SocialEngineeringElements_en.aspx> to help you identify Phishing email.



On 4/7/25 07:01, Guenter Roeck wrote:
> On 4/6/25 23:15, Wolfram Sang wrote:
>>
>>> Please help to review the attached Linux Kernel patch for xdpe152xx dri=
ver.
>>
>> To shorten things, you could return -EAGAIN as an error code, then=20
>> the I2C core will retry the message for you. Within the configured=20
>> limits for the controller.
>>
>
> The patch neglects to state the _reason_ for the change.
>
> I'd like to know what causes the problem before applying a change like th=
is.
> I suspect that the chip needs either a delay between accesses or a=20
> delay after a write. Both are supported by the PMBus core.
>

And this is a complete no-go:

+       if (ret < 0)
+               pr_warn("PMBUS READ ERROR:%d\n", ret);

It isn't even dev_warn(), and I am not going to accept patches which will c=
log the kernel log for every single error return. Just imagine how the kern=
el log would look like if every driver would log errors like this.

Guenter


