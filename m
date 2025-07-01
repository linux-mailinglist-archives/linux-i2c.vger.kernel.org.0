Return-Path: <linux-i2c+bounces-11737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04FAEFC87
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 16:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC7FB3A5CDF
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3AB275110;
	Tue,  1 Jul 2025 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUSGVF3c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE32727E2
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380268; cv=none; b=EHWjVrEFYsqDieMHMFQTq5PEqLNmif6fZ4TVChNnMLGuydj4oNyLlmUJ/hmLHbk52FxGJiFnIkv4vVfsIl6l+C2XTc4wAaVZeKhI3YMRU6txymgl2OyMZkKvRfRh75qNTuL0Wy67a6dqYC4ngovlIMJpmsN+Uyx61/qdaWWhb30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380268; c=relaxed/simple;
	bh=Sv1H6PUpb4IqYgnKgzS/L6omvxuge3KVkbdPhNY0VgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXB4xmX/YzJHwloaAEv4BtxQPYwdct/HRyxHPOP/3IbGxp7mkboMNPt2k7Lmo0mLsoYKAgo6cS59lKsfmjLvytTKrsXgpRf1W/gtx427qLC1Fb0LMStDJ4zxxBZGk+uHWA/Gip+PqoIBk7eaOqPrPaMQB4HiVoU2wdGSqOk0meE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUSGVF3c; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso3657223f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751380264; x=1751985064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJt/iCFlHtHvm0tunoe1SeVyQ5dRWwQtcraJS/9eZQs=;
        b=HUSGVF3cIu4pwbhsLWxGZ63SJzzQBkwl5itxGWon2NvBvlbBix16uzwc8VE9Q6ItLG
         faYVXH9OJVPJ7jzzRTWOfGc3XSPHfkRiQn2MqYq2EMw1bDZ4j1svKGCqSG1CffVYjMLB
         GkAA6JZZLPnWQTw/DkJn+aJo3erwq+6Oi37+j+ci9DqEjcW0Ju3YH569cbPd71QgRWr3
         QXTdqKqQKjZmWnxVsModjlHFiymHZNV4+XP6VluyD9OVu6wqx4CDinn4oE/ei3YTuMYQ
         tHAArId+nq+m32cwtLB3L54eNeE3GHnPgoW1nahGNwyKG5tf6K32Rd6AwRoE28KQoVZK
         QQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380264; x=1751985064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJt/iCFlHtHvm0tunoe1SeVyQ5dRWwQtcraJS/9eZQs=;
        b=dpo5yDbk+rzdxbWqFTAglm6LvPY3PzSAa8P/+T6q0+ORrSrxIV0hYHifRMQkIGSjqc
         h4JqqfO5DKbiclm0Y/paJHnqJ6VMvYayeVfzeUkBEkzFqcl1pjzpmtsBMoz1el7o4OJ2
         iP7DFjw97tBqRD0yRF8rmYJl3Qz68Gclf/lcq+KvtFhFP+T0NwwLkkzzmG1Lg/r6gToL
         OhG9eUS9+LxMALflA/nC6Ay0Ed4Y4MEF2FqPf/UK7iHhFw/xP6ikY/IhCzoapwszdD5y
         VSGPfjtAtlF/4p6E5YQGZ13M69JjhGOTE+BYLlK+2BkXbZqpKG+msI0i7kCoY/NWh+oe
         JPRA==
X-Forwarded-Encrypted: i=1; AJvYcCVny093jMFMtiNdasWTZ/5cA4nv5y+w3u4yKyY9+FP+cgjpBQ2F5Hg/9sSUPewKbXiRpfgOa2pkGlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAmnSZaC9jcYEGpncO01RcTWBRbajavISl0dKC90qJtxrbmhIw
	8o/DHYnPcslQnzK7W2PR/JFGIY+W6hfAVZiZa6mOjsq3oa9CKEbemeEH
X-Gm-Gg: ASbGncu559CmWOu9Iyyv4NptbLd+Dqt5/s6VHzjsh4ooIiOSH/dqueOqwYYefjxJTVm
	vqMv8/fDjSZqFQ7SBZ6aEyhbb4u1pJJHKRNrXQGQgc+C1ZadeZdzlWsmvKIPLN6/qJnEU/26y9g
	Cz25JF2faBrYq5GpUSjskF339RPoWke+7pYXpt3zv8vG/xUnQSV+6FRP2AV8aySQ7U52YIXUSGl
	DChodgFVCNHPGznOxgBny+X1jle+vcM7xK8s+UHWdqJ+YvcG1v4/O+IFoLR+ngu4xwJRcKZl3OJ
	WYbZOpqeNb4J/C094xmcj3H9NZXwYmwP/i/KCCHQVzql9FcoMzpvEL2fv6/Pa20wFRJFBPheOMa
	VEnmuYTMeyqD6ru91RJ5+LUhYl3RFaKSe3n9y5VJH
X-Google-Smtp-Source: AGHT+IEZS7S8EWkgefrNq+a7SvUOFNg/150nU5tgIGCLA5ADTG5CNSjaFnIyjqAU8VGkGrEcY94hlA==
X-Received: by 2002:a05:6000:1804:b0:3a4:f379:65b6 with SMTP id ffacd0b85a97d-3a8fe79bb4bmr11815710f8f.46.1751380261915;
        Tue, 01 Jul 2025 07:31:01 -0700 (PDT)
Received: from [192.168.255.3] (253-8-142-46.pool.kielnet.net. [46.142.8.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5966csm13526266f8f.72.2025.07.01.07.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 07:31:01 -0700 (PDT)
Message-ID: <123042be-63dc-46bf-b781-6da022a8f4c5@gmail.com>
Date: Tue, 1 Jul 2025 16:31:00 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
 <20250701091737.3430-4-jelonek.jonas@gmail.com>
 <d123375e-48ec-43f1-bc5a-1256c2f377ec@kernel.org>
 <ad8d7f0b-1c25-4a1b-89db-6631d918f9a1@gmail.com>
 <b3e58bf1-d51b-481c-892c-4115bd106ed9@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <b3e58bf1-d51b-481c-892c-4115bd106ed9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01.07.2025 15:17, Krzysztof Kozlowski wrote:
> You have some very odd wrapping of emails.

Sorry for that, I'm not used to this workflow and obviously haven't configured
my editor properly. I'm working on that.

> Anyway, you keep mentioning in multiple places rtl9311-9313, so that's
> confusing. If you mention them, I would expect compatibles. They cannot
> use rtl9310 compatible alone.
>
> I don't mind skipping them, but then just don't mention any sort of
> treatment for other devices. You add this and only this hardware, if you
> do not want to follow the make-binding-complete principle (see writing
> bindings).
>

I think I got. I'll adjust this in v2.
>>>> +  scl-num:
>>> No, you do not get own instance IDs.
>> Is that meant for the wording/naming of the property and/or its
>> description or for the general idea of this property?
> You do not get such property. We don't accept it, it's generic rule.
> Nowhere in the kernel... unless this is a standard, generic property
> (there is no vendor prefix), but I could not find it. If it is standard
> property, where is it defined in dtschema or common bindings?
>
> I don't get the need for this property and description does not help, so
> just drop it.

Ok, I missed that this is seen as a generic rule then. Sorry for that.

For the purpose:
RTL9310 changed the register layout compared to RTL9300. Activating
the SCL line is done by setting bit 12 for master 1 and bit 13 for master 2
in a global register which is located before the master-specific registers.
Thus, the driver needs to know which master (1 or 2) it is currently doing
something for. That is what this property is intended to be used, naming
to-be-discussed.

Alternatively, this could be derived from the reg property if that is
fail-safe enough. The value of the reg property has to match anyway
to make the whole driver work properly.

>
> Best regards,
> Krzysztof


