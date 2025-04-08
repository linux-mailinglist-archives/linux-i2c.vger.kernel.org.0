Return-Path: <linux-i2c+bounces-10202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D15E3A7F372
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 06:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815711894040
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 04:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0036C2040B0;
	Tue,  8 Apr 2025 04:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlhPf/wL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFB317A30E;
	Tue,  8 Apr 2025 04:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744085169; cv=none; b=W7XwuzAi29cjwPJCa3W4VsPSBLMLvEXAObUDojuH60hCzW3HKgrKa1vujoXQ6I1H4DXeN38TtaRBdc74KHnn58vWKxX/tp7i25eoi3Wr7giimGZumq2lBSiWWpR6XxDVfGtDLMeH+OV3m4uAXxh2xuTb6WSYyBG+227w6L09k3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744085169; c=relaxed/simple;
	bh=VZTUsYrWiw/dAatgPpSHB9WZM5HKRWiduaJ76PaT+Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HiV7rcYawLnt3bhkf8QeSU4uHjLy2I2+RzNSezpWhI/0LzV2TVvYUBu+wVnuQt6t2qDNbtefvnMutCmcLSJ0Wqfjplhu0uQcfNjIdaNNaI+m8tFa5APMXa0LL5f480L6hmeDjwbOpIxWN5J7lGulKtJu69AUa17tKZeilAsXp78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlhPf/wL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225df540edcso60597055ad.0;
        Mon, 07 Apr 2025 21:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744085167; x=1744689967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=J+p59aNwlK5KwKG+3EdtdbfN6u24/F294o2ySFPqolg=;
        b=WlhPf/wL2KnU17prUD5yBUv31bNkgfdKuvqjdJKwifBZ2hQu9N88pJLJZPQd2uNGgS
         kUCyWo+ALyh6mx5z8wYddibIAklgmTcEMuiw/szNkG5dXgFOI4oaGs5HSpopweyFqyYH
         mvqstGpeMO7n4TBNnjF+rvVQv2aGSSupkmFjKBxyTnEvz+borfz+r2QvVV7CkhwxG8Lo
         Sg6Pnap5NaKWo1pQ0m3c1lBoL2pw1FGSbm72ssl28PkQDoimpkXGm/yS9egrbybJv/E/
         B6CCD8V7M7xIyqK+rwEnpWlApa3fJHhFmATFDCUJaskI2A7dE1USCNMjtcWu3yfJFi9S
         d2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744085167; x=1744689967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+p59aNwlK5KwKG+3EdtdbfN6u24/F294o2ySFPqolg=;
        b=mNPemAzZp54nJke7yL8gwnctIH/YSsKjE2yd/J/R/IH4Ob+STWV2mS2hR7v1Tt/B4B
         Z6AI2fuQ2oKj5MStm1ze2tlm3eUydyExkClMhjS5olDp3uOfQ+OZnFGbd7gOIskHH3LP
         wrkHzclmkOACbhjsHYNJszcM2UNaAZZny3vDzBp+pHYBn4EHUQ9aNiEeyINlDh5E7+Fk
         VSbp72LRcRqUo4s6d1hrIkwslgll3GLJvvyO24OfaPmK9P7CCJrymtKeaK0BTIZCRd7g
         RJDSpQcUqnKl/6KvcmhDidzvA7CPgbC8Y9CLEVOFfOV8E+rvJXj4i23sjXxAM5ICk7sL
         m5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUerTAbqdexCaW4p7U6jj+Pos/bUt+Jqiw5zhvPd4ahPW5qzD0wGQqWwOYqZdksHzf5sykhj1E5Oplt@vger.kernel.org, AJvYcCVSXIJRW53BmBsGXBIpLe+DT3H8j3IGRIXJFxDsXiPv6Grdj+YLyXuy/5Y0jZ7M2OdZ36ttP0LIqbZ9MX8=@vger.kernel.org, AJvYcCWJg2Ww65sfh+h6yvu27Gdt8Rj2TtuVQRbvBccfMkrsweq3gbiPkTorh6Kx6hwd6131NmdMJssaxNq0@vger.kernel.org
X-Gm-Message-State: AOJu0YwlT252F2VJCHinwk+Jt7kUq2zvKPXMv3Gb2LQBAonjflqgv8XO
	lRPGsWErJR1BoPjDh+9HtqlUYeuM6ddLUb4dD/dEyXx+qxsXsJzuVPy+Fg==
X-Gm-Gg: ASbGncs0IZ0BCVp/aBoh+GZiutFTq3QhBjVbw4z+WFEPcxy77mfl+Rxmtn6HN8/EVoX
	eQIqEeO1shgiAZsjGWQbv6jmNHgpwpH2OakjMOK2t17AI00pSEjdpHb3WUQPyZ8s5s6KhvB4dZX
	zr9Sg1MP8q6C1VQM1jqOVdifgQk8x+A00o6aLnYOiMEkgtnXFdevogDvEtAvvC0KxXaOK4u14SY
	aqzx9Or812q5nIMqUxuS9DFpEWclxsVFy2sGHVJs+8zshtJzTNw+FjRyQmbOMaSmdgizqT7hfVB
	fVZ6SwgvRXSGfwMbK3otzphpyNJ7ptk0j+53esUB60yJYjlATrXLkKnrkbN7yUtm0S9CSJkOz7h
	WJSpNyFQXJhrzrUgxkg==
X-Google-Smtp-Source: AGHT+IH0gbeiwLH6k7JdFNxuufWhoEsbTH1gZXoME+yU/Q5N5PsV0LVsmn8a8JYSu1LQ9GQF5snbpw==
X-Received: by 2002:a17:903:1381:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-22ab5e9d33emr31375205ad.25.1744085166910;
        Mon, 07 Apr 2025 21:06:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866eca9sm89784535ad.170.2025.04.07.21.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 21:06:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <92296673-ec19-4026-a0ae-3e06c0f272b7@roeck-us.net>
Date: Mon, 7 Apr 2025 21:06:04 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Update driver xdpe152c4.c
To: Ashish.Yadav@infineon.com, wsa+renesas@sang-engineering.com,
 Shirley.Lin@infineon.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net,
 patrick.rudolph@9elements.com, bhelgaas@google.com, ninad@linux.ibm.com,
 festevam@denx.de, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, Mills.Liu@infineon.com, Ian.Fang@infineon.com
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
 <Z_NteUAIeuDdDPls@shikoro>
 <69c8cf7c-b334-4f13-ba36-a2248686b419@roeck-us.net>
 <3df0bfff-413d-4ad5-a3a8-39a7bb7a90ba@roeck-us.net>
 <c8b9aa8e579e4892a35542f59cff44e4@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c8b9aa8e579e4892a35542f59cff44e4@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 20:28, Ashish.Yadav@infineon.com wrote:
> Hi Guenter, Wolfram and Mukesh,
> 
> I hope you are doing well.
> Thanks for your suggestion/feedback.
> 
> Sorry for the inconvenience.
> This patch is still in the testing phase and not the final one, that is why  " pr_warn()" is used for debug purposes.
> 
> We will get back to you with the final patch with proper process as suggested by you.
> 

Please provide an answer for:

 > I'd like to know what causes the problem before applying a change like this.
 > I suspect that the chip needs either a delay between accesses or a
 > delay after a write. Both are supported by the PMBus core.

There are various microcontroller based PMBus chips. Those microcontrollers
sometimes need a delay between accesses to work properly. That is why
access_delay, write_delay, and now page_change_delay are supported by the
PMBus core. It is at least somewhat likely that the xdpe152c4 has this
problem. The delay between retries in your code is an indication that some
delay between accesses may indeed be needed.

Another concern is the need for retry due to PEC errors. That would normally
be due to a bad board design, which is not chip dependent.

Long story short, so far not a single PMBus chip needs retries. It is very unlikely
that this chip is different. You'll have to provide substantially more details
for me to accept retries instead of access/write delays in the driver.

Thanks,
Guenter

> With Best Regards
>     Ashish Yadav
> 
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: 07 April 2025 20:06
> To: Wolfram Sang <wsa+renesas@sang-engineering.com>; Lin Shirley (SMD C3 GC TM DCO) <Shirley.Lin@infineon.com>; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; jdelvare@suse.com; corbet@lwn.net; patrick.rudolph@9elements.com; bhelgaas@google.com; ninad@linux.ibm.com; festevam@denx.de; devicetree@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-i2c@vger.kernel.org; Liu Mills (SMD C3 GC TM DCO) <Mills.Liu@infineon.com>; Yadav Ashish (PSS PCS RD FW HD) <Ashish.Yadav@infineon.com>; Fang Ian (SMD C3 GC TM DCO) <Ian.Fang@infineon.com>
> Subject: Re: Update driver xdpe152c4.c
> 
> Caution: This e-mail originated outside Infineon Technologies. Please be cautious when sharing information or opening attachments especially from unknown senders. Refer to our intranet guide<https://intranet-content.infineon.com/explore/aboutinfineon/rules/informationsecurity/ug/SocialEngineering/Pages/SocialEngineeringElements_en.aspx> to help you identify Phishing email.
> 
> 
> 
> On 4/7/25 07:01, Guenter Roeck wrote:
>> On 4/6/25 23:15, Wolfram Sang wrote:
>>>
>>>> Please help to review the attached Linux Kernel patch for xdpe152xx driver.
>>>
>>> To shorten things, you could return -EAGAIN as an error code, then
>>> the I2C core will retry the message for you. Within the configured
>>> limits for the controller.
>>>
>>
>> The patch neglects to state the _reason_ for the change.
>>
>> I'd like to know what causes the problem before applying a change like this.
>> I suspect that the chip needs either a delay between accesses or a
>> delay after a write. Both are supported by the PMBus core.
>>
> 
> And this is a complete no-go:
> 
> +       if (ret < 0)
> +               pr_warn("PMBUS READ ERROR:%d\n", ret);
> 
> It isn't even dev_warn(), and I am not going to accept patches which will clog the kernel log for every single error return. Just imagine how the kernel log would look like if every driver would log errors like this.
> 
> Guenter
> 
> 


