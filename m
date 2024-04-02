Return-Path: <linux-i2c+bounces-2712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE48894F4B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 11:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3ABF1F247A1
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 09:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4665A104;
	Tue,  2 Apr 2024 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tkLfejDO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE1A59B56
	for <linux-i2c@vger.kernel.org>; Tue,  2 Apr 2024 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051845; cv=none; b=JF6A2Vxv/8htJL3xTuPTpj8ecXEPQPs5f2UiJfHd+pWqv6tURX8vzuwd8X6Y4+JBragRndMNc8OUqrjCqDKHl0gQ007E4AFrRFAoPAY6Wppa+CxhUakJjX88/zgo2uObLP+Xv4TdLvs/wxh9N+Ah3SyxoYUc4Zg6b/QV0aV7AoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051845; c=relaxed/simple;
	bh=bVr7n1vKYGpZMuyW64Mo4Xysn38KZd2exTIGpx5at2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrxc+3bF1pR5DLsXXdcep6cLULpN2tP1QyEwt/fOLuDsfgTaMLHp9SctgUka34I9K7dwFwmSKfv3hbcQbk5FOKEX1mxnNV0l5Oipl1UgmS3s+4/rZYAS/54BVE7MhAWM+bgHCtizBMM0zMcM3mTIy7oLvjj0w1q8+xFi5b/4ubU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tkLfejDO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d718efedb2so69315881fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 02 Apr 2024 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712051841; x=1712656641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KaALGpR55LLYN546Bwu1n1OTGHrwQpx5Bj/luubs+R0=;
        b=tkLfejDOPEblI2k3NaF0y3zDPUpeAOWvdb2s84deZEeKntocfjKOf8kNHGzORdfVaF
         DtXoMY0uERnly/kl/V1BhXCQATiCH9MQljw6bFJfhS0mijDmm4m3soTO8K+vQcUBfXKg
         7facdWT3o7dyG5e9zDhVuqC62MEK8QIm4N8laAjSsbVKeyIDcWwzyFs8LmyRLFG3AYpb
         mTCel2CVAeGCu8oDrWSBjAAW037O5Ukp+X/Tc1DjUCv89zNE3cStzll3CgyD3gWT/yum
         chC88BvhSKfTBJGCY14qD048bvyFfQG61S9nQzNF2JjBpglvQ0NN6I/6wnln35SYTKDx
         hcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051841; x=1712656641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaALGpR55LLYN546Bwu1n1OTGHrwQpx5Bj/luubs+R0=;
        b=SvcQPVl8HIrrwFPCOtf11mx/qVtFGdlzN582TMn7eBgqhvoc1lvhpAiSdD9aTV7anJ
         Fatl5hKPv5YylllsUf++WNtTH7HpFTIUKi8rsKQhYeD1F7U7XUpENe0GD9mLJJvdpM7B
         bNWEXtb9KQG6gFmWjIOJTde1oxVYOOYk45smD1K6EdcOItfjO9d/3eLRAClu6U2xkKNP
         lyXBkceI8wdjhdgaa50jJKw2s2aHhr3jbqZfsTQ/MPWK5VrlLmL2gGe2uCGzNLRma+ej
         VzpZe7eN9oimmHzzAtt9Y6VWo0goN3oxWTUjIodALYB1daPl8GEt8zqMyBLUL8ZeqRpD
         CUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQeNalmXPrlRcoxKrbvG2agrIb2cQqB0BgeMGc4SKE0uL0wSO29BEiXiVaPmntL1gz52KJaHer4dbU+2BMKIQ0nJCAZklPGsqB
X-Gm-Message-State: AOJu0YzLw81ZefNhAIrm1HRU5AU6EUETkSXxs77tHdnPLcklg4OjyGOf
	DdX7Eu3xgZpy7+xaR3fY2PRmvKn21Nu3xlMospXH8Mmb2lLgMxI0OqlLXHd1Dzo=
X-Google-Smtp-Source: AGHT+IGWCEOGN1+XjtzfYre7/egOrrrKPQ8Lfe9ZEH+5g0W7eKr0xB6p1bbpF7hXyXxGItvb0g1xWg==
X-Received: by 2002:a05:6512:403:b0:516:a686:8ae1 with SMTP id u3-20020a056512040300b00516a6868ae1mr1017019lfk.62.1712051841164;
        Tue, 02 Apr 2024 02:57:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id r1-20020a170906364100b00a4628cacad4sm6312315ejb.195.2024.04.02.02.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 02:57:20 -0700 (PDT)
Message-ID: <47813c01-39b2-4e5e-bb67-1d49788fc613@linaro.org>
Date: Tue, 2 Apr 2024 11:57:18 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <f514d9e1-61fa-4c55-aea1-d70c955bb96a@linaro.org>
 <ZgvIMRDfeQaeVxYt@shell.armlinux.org.uk>
 <ZgvKh/Cwudh3gCDr@shell.armlinux.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZgvKh/Cwudh3gCDr@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2024 11:06, Russell King (Oracle) wrote:
> On Tue, Apr 02, 2024 at 09:56:17AM +0100, Russell King (Oracle) wrote:
>> On Sat, Mar 30, 2024 at 01:18:30PM +0100, Krzysztof Kozlowski wrote:
>>> On 26/03/2024 21:23, Krzysztof Kozlowski wrote:
>>>> Merging
>>>> =======
>>>> All further patches depend on the first amba patch, therefore please ack
>>>> and this should go via one tree.
>>>>
>>>> Description
>>>> ===========
>>>> Modules registering driver with amba_driver_register() often forget to
>>>> set .owner field.
>>>>
>>>> Solve the problem by moving this task away from the drivers to the core
>>>> amba bus code, just like we did for platform_driver in commit
>>>> 9447057eaff8 ("platform_device: use a macro instead of
>>>> platform_driver_register").
>>>>
>>>> Best regards,
>>>
>>> I tried to submit this series to Russell patch tracker and failed. This
>>> is ridiculous. It's 2024 and instead of normal process, like every other
>>> maintainer, so b4 or Patchwork, we have some unusable system rejecting
>>> standard patches.
>>
>> Sorry but no. Stop being offensive.
>>
>>> First, it depends some weird, duplicated signed-off-by's.
>>
>> Eh? There is no such logic in there.
>>
>>> Second it > submitting patch-by-patch, all with clicking on some web
>>> (!!!) interface.
>>
>> Again, no it doesn't, and you're just throwing crap out because you
>> failed. Unlike most of the "normal" processes, the patch system allows
>> you to submit both by *email* and also by *web* for those cases where
>> the emails get screwed up by ones company mail server. That's why the
>> web interface exists - to give people *flexibility*.
>>
>> The fact is, the web interface is merely a front end interface that
>> generates an email and submits it in the usual way by email - an
>> email that you can perfectly well generate that is *very* close to
>> the standard email that git format-patch generates.
>>
>> The *only* difference is that the patch system wants a KernelVersion:
>> tag in the email _somewhere_ and it doesn't matter where it appears.
>> Git even has support to do this.
>>
>>   git format-patch --add-header="KernelVersion: $foo"
>>
>> Why does it want the kernel version? Because when we were running 2.4
>> and 2.5 kernel versions in parallel, it was important to know which
>> tree the patch was being submitted for. It has continued to be required
>> because it means when there's problems applying a patch, it gives me
>> the additional information about the base used for the patch (and it
>> keeps on being useful to have.)
>>
>>> That's the response:
>>> -------------
>>> Your patch has not been logged because:
>>>
>>> Error:   Please supply a summary subject line briefly describing
>>>          your patch.
>>>
>>>
>>> Error:   Please supply a "KernelVersion: " tag after "PATCH FOLLOWS" or
>>> "---".
>>>
>>> Error:   the patch you are submitting has one or more missing or incorrect
>>>          Signed-off-by lines:
>>>
>>>          - author signoff <krzkreg@gmail.com> is missing.
>>>
>>>          Please see the file Documentation/SubmittingPatches, section 11
>>>          for details on signing off patches.
>>
>> Lots of people use it without a problem. I've just run the parser
>> through its offline tests, and it parses email content correctly.
>> I've no idea what you're doing wrong, but it looks like something
>> pretty serious if it didn't parse the subject line.
>>
>> Rather than getting stressed about it, why don't you send me an email
>> the first time something goes wrong so I can investigate, turn on
>> debugging to capture the problem email?
> 
> ... and I'll also point out one of the biggest problems is people.
> People who think it's more complex than it is, or who can't read
> instructions.

We all read submitting-patches instructions (and many more). A need to
learn one more set of instructions for one more process leads to people
needing to learn 100 different processes for 100 different subsystems.

That's not the way how people should be contributing to Linux kernel.

> 
> For example, trying to tell people to use the standard format subject
> line:
> 
> 	[PATCH ...] blah
> 
> has proven to be hopeless - unless one states to them the exact
> sequence of keys on their keyboard to press - yes, it *really* takes
> that patronising level to get everyone to understand. If one tries to
> do it any other way, then you get stuff like:
> 
> 	"[PATCH ...] ..."
> 
> with the quotes. Or some other stupid variation.
> 
> The patch system is as forgiving as possible. It takes standard git
> formatted patches (with the exception of wanting an additional tag).

The additional tag about kernel version is redundant and not helping
anyone. I doubt you apply patches on top of linux-next or top of
previous release (e.g. v6.8-rc1). Almost every maintainer applies on top
of current RC, so v6.9-rc1 currently, thus version is just unnecessary
obstacle.

> 
> It is possible that bugs creep in - particularly when Debian updates
> get applied and change the way Perl works, but I don't think that's
> what has happened with your situation.
> 
> I _guess_ you're putting the entire email-like output from git
> format-patch as the patch file. That won't work - that isn't a "patch
> file", that is an email/email template, and the patch system will
> attempt to parse that as the patch itself.

Yes, that's what every sane person's workflow is. git format-patch -19
(cover letter goes from branch description).

> 
> I suppose you term "patch" to be the email as well, rather than what
> I interpret it to be, which is only the output of "diff" - call me
> old fashioned but that's what a patch file used to be before the
> waters got muddied by git "patch files".

Well, world is now using git as a standard. It's true there is quilt out
there, but even Andrew I think is going slowly towards git in some parts
of his workflow.

But then even Andrew accepted standard patch from the mailing lists. No
need for any other step, no need for any double submission (one public,
second to patches@armlinux or webform) with any other requirement.

Best regards,
Krzysztof


