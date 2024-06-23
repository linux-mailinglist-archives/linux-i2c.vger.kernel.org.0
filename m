Return-Path: <linux-i2c+bounces-4283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84958913B96
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 16:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A924C1C20FD1
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 14:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2396FB0;
	Sun, 23 Jun 2024 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+Q//1RH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C179CF
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719151236; cv=none; b=B7dG9QJ/vr984SjX78pNMY+igdLLpxFm3QPjxLe478ak+qpNOaAXZPZ0i0SZoUl4ClQenftFsf9M+t8854J0Tp77XKN/xxICnGd1F2lJFwBwsRszN3wYgXXpEeoh0SvceIYRffYf2eJ5WKIgfPPY2kUY6DuI+qR+QaVtwjjpAGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719151236; c=relaxed/simple;
	bh=rsP8BWOGdogH7dcA8Y47R7yt2adq4IFGrhn9/Lx3Stg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6bJ3toP4jxOYRNJI9MCK7/kfhoNg+c32+ADZpaoXPagln30czQgH+5OqtEzeGDm7AHYmmhrFuG0ydXO/AensPgPCvMF99YgERnPxZZFlTwcpWk7+ZrU/CFrvlcDZU8OeC6bMQ3GrQGHe2GzJRe6iUnWQWZjmMRNlQHu+px30tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+Q//1RH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719151233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibSqRtaOdne/HeHVNJZVUdbHnsi0e9M3XLAFNHiSqzs=;
	b=J+Q//1RH26ZEwvVk+4u4aff84z0WLkM+psWFvNHHolqYU8kB1ve0maQc0sL65gHQPxgouQ
	QrLNDdju+l9LrdDlsZ6KwVolckjO1zKNEScVIZ9dWnQwwiuQBc6HqQxtgk3zBKTWRBxONu
	S/i80637Yp/e4l1yevJJOZ4wSo8vvQk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-zEwiMYXAOXubShB6zA5DVA-1; Sun, 23 Jun 2024 10:00:31 -0400
X-MC-Unique: zEwiMYXAOXubShB6zA5DVA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6f2662d050so163911766b.3
        for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 07:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719151230; x=1719756030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibSqRtaOdne/HeHVNJZVUdbHnsi0e9M3XLAFNHiSqzs=;
        b=LX0MVK//9NdYQPaawX/BTuod0rKzg6vNE31JQ8Om+medolPZD5siAyXG+CEc8TM2yG
         cPAnUfEzOeheiSDkVFc/j/jho8kAr59s0Z7yNrj54LamU/5uTnNffuymZnYQfJRLXWUP
         Q1OZ9UmJKBXV95fH5zP48ofRzzy+9JxBZSs5uEjp8MpB1j0ckIA/bLIiPO3oJGoysOok
         AfRanGB42cY30m3fwduK/hBitOZcwN43Oblojmuzy1kHpTJor562j83jJAzZ//a/arND
         DR2fcuL0dQZ6w7nbBMtEeBNa2NJjDRFBdEPJ38CHNpNuAYLvESZJm4Fx3m9r9iRVz+Y1
         nKsg==
X-Forwarded-Encrypted: i=1; AJvYcCXq6XU8AnQNc6LjxNvCn7LjUso6SNjb0NYYzJdM5uCAGbsfWoBDvuxw6GNgT+8qrtpJ96E6PqRR0EpAEsVuBtECufecvKejV5wL
X-Gm-Message-State: AOJu0Yy6dhBMxkPBXmlvsuY+DBgqAdTUWY+SVgpKwwXJvLsmOaTKJucm
	PSQB7vDHnxJ865tMl0EUrW9FjkgDLVx00K0YsCKbJh5dw3TM87n8fq2dtTMwUKr7QaM34OSBi5Z
	sStpm6zkQhfH5SgnBVsZ0JQjMHiXkS+ZZCJAfOH5gcdfuL2m8HfFpT1qCHw==
X-Received: by 2002:a17:907:d30c:b0:a6f:af58:efa8 with SMTP id a640c23a62f3a-a7245dc96d9mr129110666b.51.1719151230338;
        Sun, 23 Jun 2024 07:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpFeXEL8p77wHjNfTECLotTB0sVdbF2XORthfujctCeDsla2WsFqZLEf2CdbOfuyGWrcUFnA==
X-Received: by 2002:a17:907:d30c:b0:a6f:af58:efa8 with SMTP id a640c23a62f3a-a7245dc96d9mr129108366b.51.1719151229822;
        Sun, 23 Jun 2024 07:00:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf5490d9sm305142866b.115.2024.06.23.07.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 07:00:29 -0700 (PDT)
Message-ID: <2aa599a4-493d-4d2b-a307-22e1a4928ff1@redhat.com>
Date: Sun, 23 Jun 2024 16:00:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali> <20240622164349.fycelzxcd45j4g22@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622164349.fycelzxcd45j4g22@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 6/22/24 6:43 PM, Pali Rohár wrote:
> On Saturday 22 June 2024 16:20:15 Pali Rohár wrote:
>> On Saturday 22 June 2024 16:06:01 Hans de Goede wrote:
>>>> Also does the whole device table has to be such verbose with lot of
>>>> duplicated information (which probably also increase size of every linux
>>>> image which includes this driver into it)?
>>>
>>> struct dmi_system_id is the default way to specify DMI matches in
>>> the kernel. This avoids code duplication in the form of writing
>>> a DYI function to do the matching.
>>>
>>> In v2 of the patch-set I only matched on product-name, but you asked
>>> in the review of v2 to also match on sys-vendor and you mentioned
>>> we may want to support other sys-vendors too, since some other brands
>>> have SMO88xx ACPI devices too. This more or less automatically leads
>>> to using the kernel's standard, existing, DMI matching mechanism.
>>>
>>> We really want to avoid coming up with something "new" ourselves here
>>> leading to unnecessary code duplication.
>>>
>>> Regards,
>>>
>>> Hans
>>
>> Ok, then let that table as you have it now.
> 
> Definition of the table can be simplified by defining a macro which
> expand to those verbose parts which are being repeating, without need to
> introduce something "new". E.g.:
> 
> #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr) \
> 	{ \
> 		.matches = {
> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."), \
> 			DMI_MATCH(DMI_PRODUCT_NAME, product_name), \
> 		}, \
> 		.driver_data = (void *)(i2c_addr), \
> 	}
> 
> static const struct dmi_system_id smo8800_lis3lv02d_devices[] = {
> 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E5250", 0x29),
> 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E5450", 0x29),
> 	...
> 	{ }
> };
> 
> Any opinion about this?

Thank you that is a good idea. I'll do as you suggest for v4 with
the addition of Andy's suggestion to use const in the cast.

Regards,

Hans



