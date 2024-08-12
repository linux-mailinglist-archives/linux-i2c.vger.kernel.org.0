Return-Path: <linux-i2c+bounces-5319-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641594F839
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 22:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38FD41C21B74
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 20:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBC01917DA;
	Mon, 12 Aug 2024 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUMHfBzO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939417E46E
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 20:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723494617; cv=none; b=q6aTpgxWU7XBV9rwAuoqUzNgqlLnmrD3ehO2P3HBqHYC2iKGdS6v9Qal4M8+nm6YnXlM+MLKNQ66j/GoZKD6hYyY5v9d7kLkMMOzURr6NNugTOpx1OP8iyWTydWsWDkIz8YrBFMXu2dKZAawGJYdVqCIq3RBWYWPezJ6tGJc+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723494617; c=relaxed/simple;
	bh=b+fOw0HfrYbHHJSFLtHz2DQ5lSVg+JzT2Fi9wPOX0zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWsBFphXxb5+znlB8RAu7T0JD13CxAxPMm9zHHCMar81mxVCbcBAVSeMIwWurZ5S1jR3VxSfLvIdP/VpUP40Mar3y+RMDejcRCtnGGODwBuZmfbWj1dyJAyoMfnB0ICUQiJBNi7ywAVQzGDXFUXd8l26DcTi5SZbKE58cB+AHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUMHfBzO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723494614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MDvJJylq/moYq+QuSMRAZKQLpyZRrzL3yU2+Tfj/j30=;
	b=gUMHfBzOp4at++JTnijnnDdK+wrGCBbWBzQu1Y+W5LwWcJLmxthJGutc8V+VfIkVEkLNko
	5XNjTyCoqGM0N4x6PWIC81xZ/DGDjApTDtVjKC7RCTlDhptiLGWqvwDbLfAOmF9TuC4Sxs
	ULB3YyAYv2sphkLzNa0SdS1Jmci8vZc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-MIoQDK_sPBeDFFytRiYMzw-1; Mon, 12 Aug 2024 16:30:12 -0400
X-MC-Unique: MIoQDK_sPBeDFFytRiYMzw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7d6a72ad99so355847866b.2
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 13:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723494611; x=1724099411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDvJJylq/moYq+QuSMRAZKQLpyZRrzL3yU2+Tfj/j30=;
        b=DY2bmfxbSLC2lw6E+X9UnKnaoUA3byRvN/jT1VTeWjsgm0n2lElDMPt4g5arE5wDyU
         h9S+wSVuMIqEfYJnDqTtywJ3Lxzb/PFHJbjd7MhfdF4gICE34T8hZbH5PjdT3k/g6CRL
         OnWcE+99Cf+DUAYb3GLACAih1XuamtKJB7PnET9iprlkJ7bj5EJ+arblBYhNCAYH3qug
         iOAg/H04F1cpjvFFLxDPKiENESO9VGcAJSzZNpnSYkgRpfDBXiV0WeUU8/yT3mbr+EnH
         wwfmPnfIjqhEfKU/QY+x13NZ49jt5Bio3D1W/jhVn6wkWJz6t6qXeOu7bPk8YdInLO8O
         Ll5g==
X-Forwarded-Encrypted: i=1; AJvYcCWIej5Ky6LAfPutpHKADHjOnuowUdL2pxidhAQLfJlxfO7KHlFwYszppP3YSzS5we9TTFA0T2xpSGw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5111pTCWZK28oXW0QIFTrfjKkTObu1teG4LnqBIqa8ljv6BK
	/bT1vxU3gkYYCuh5xg6XWVIqlNxw3O2LBn1J/9W17ZclOmJErbfWBkx/DaaFY2YuXZYsdMoHfmE
	HuP/A5MjvXVp+flWkb22DycPTCmE6zxa2KTvZ0KrhiFSzaM8OVv3Wz3a5hg==
X-Received: by 2002:a17:907:9495:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a80ed2cf7bemr97947966b.53.1723494610798;
        Mon, 12 Aug 2024 13:30:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6K9VOrKZwhNIzn/L3nC60slMnzZve3t9q0ouYa/y67L5SW0kEllswsZyJfD6tkYNhLJkZWA==
X-Received: by 2002:a17:907:9495:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a80ed2cf7bemr97945666b.53.1723494610310;
        Mon, 12 Aug 2024 13:30:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdc0sm7845466b.118.2024.08.12.13.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 13:30:09 -0700 (PDT)
Message-ID: <e175f64d-cf5c-40c4-9bda-c9adb92aa261@redhat.com>
Date: Mon, 12 Aug 2024 22:30:09 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] platform/x86: dell-smo8800: Add support for
 probing for the accelerometer i2c address
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240805133708.160737-1-hdegoede@redhat.com>
 <20240805133708.160737-7-hdegoede@redhat.com>
 <CAHp75VenFFqtkxVjOvWcA52NV8jTcmu5usnW5fv5VSxsq74ysg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VenFFqtkxVjOvWcA52NV8jTcmu5usnW5fv5VSxsq74ysg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/5/24 10:51 PM, Andy Shevchenko wrote:
> On Mon, Aug 5, 2024 at 3:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>> of the accelerometer. So a DMI product-name to address mapping table
>> is used.
>>
>> At support to have the kernel probe for the i2c-address for modesl
> 
> models
> 
>> which are not on the list.
>>
>> The new probing code sits behind a new probe_i2c_addr module parameter,
>> which is disabled by default because probing might be dangerous.
> 
> ...
> 
>> +static int detect_lis3lv02d(struct i2c_adapter *adap, unsigned short addr)
>> +{
>> +       union i2c_smbus_data smbus_data;
>> +       int err;
>> +
>> +       pr_info("Probing for lis3lv02d on address 0x%02x\n", addr);
> 
> Using dev_info() against an adapter device might be more useful, no?

Ack, good idea, added for v8.

Regards,

Hans




