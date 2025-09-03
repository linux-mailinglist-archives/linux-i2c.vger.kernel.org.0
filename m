Return-Path: <linux-i2c+bounces-12588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A094B42728
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 18:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01ADE3BAC5C
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 16:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EC5307AFC;
	Wed,  3 Sep 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiuUavT9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA868303C88;
	Wed,  3 Sep 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917842; cv=none; b=BCgPG6yr4j1WzG8A5bG2D+Ljm8++rrR3HxdiN6S38F2jGAamm7FVGjN16S4wbKhVngFhaQGeOe6dAHxmJMZ1Y+L3xkOpe2WVz+EDVDFxMTKkMrETimdtpOqM5NekSDieZPuD6vbNnwgNLQoJImfUtP5oOx1oRzVAgE2TrWlyfL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917842; c=relaxed/simple;
	bh=ZEpEo0HqQ+7TROEllZ65s3PKRSyeUgAHYsJL0nuS9SQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gxtS7tSWp04zQcqVgjf4wCJKeKqAcvzArD+xTL8UqwjTMfPvYdyv7N+Cv9EVOmXLeuLpEkXdB2zncVIfMj3UG/jZEus6UacMk23jxCKrvy8tie5rKt5ticlOTTcTzsMP0hs/59dK1RCDQJkgiEDO5Z5trXD80oQiIG3yXu+qbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiuUavT9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-805a1931a15so14294585a.1;
        Wed, 03 Sep 2025 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756917840; x=1757522640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CPFA+L4AzTHvY63w8wb2OR/q6TIxMx2RwJU0a3Nq7Dc=;
        b=EiuUavT96aY0+s1zso1+uYSRj0dXoHkIJPDeUZKbQgvY18/qX+C078D8U03UKctNWV
         GY9PuQpSbf114o2XKTNbPLRk4nVNH2+hbdWRA/lkK3OA4d1iXqMPyLdxXVg8kWhvUyJ2
         pAbYTqLXtgjYuvvlilQYkTEPbl1/4hzT2sYY/RHdE9mwYE7+IgwUZwENoeoX10aQDxS/
         VDagvTlPDrsc4noLqfaUM8B1OYOkdeowWkjvG+BN7+g4yILJPytmST2CwNofSH9WNPSz
         2q58KJ8R6j/+VL/ed4tOwGIKzMlU/7Wnx89Sth+56ZpTAtjrvAHRw/ieeLajGIVa/31P
         /KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756917840; x=1757522640;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPFA+L4AzTHvY63w8wb2OR/q6TIxMx2RwJU0a3Nq7Dc=;
        b=YosXo3+wFOAhDSh6cF6XiHSkiCUFVgVdjbFL4JB6LiMpZpQ/xfpncKGuVwBk864Kg1
         6sspPY9bZ6lshOPJJug5KDn9i/ub9alN0f2kqjfbSsYrSJmSREzfx15dmN9puPO52Mw6
         WvjdG0aknWr4D+QeWlxYpLLLQgtjnkDHJvB2r94Tlc+7HTktVlDvKCRE9x2nurjXqAIw
         GOa2P4FZUvcisP6ox9Q/bp2OqD3rcCSrnowrwKUSoPoXwQaSBFDyUG6SYvVoqqMpD0dX
         eeN6na+B53MduyCqeGhiuhHOzA4RQLO/ioxi+E0dVzepNrUOfG9lEUecENCscAsqrOMS
         WT0g==
X-Forwarded-Encrypted: i=1; AJvYcCW8eTUh0Ms1Q+5RWcHYYVwa1cQaepE3ZT3R4xpPtZf57nKiQBLf9r4tVCQw7AcKdSVZaEi2i6/LpcX7@vger.kernel.org, AJvYcCWWfYg8ow97tjtwBPkYuoDTnoTGj8zQQXsRzxCSU4JlxjF3ouCs9NA935N9Bxu7sOrtnS6fqK3bF3BPP3Lm@vger.kernel.org, AJvYcCXUulx1XfvAxpY6E2mF1Dm3YuyJFd7/xNRswSecZgzG7/77hIovH0UQUzgmfMmtQV63xILrBEpWrQNC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw0IO0exV5+ZxWrznX8jNj2/5aXWKu1otBfkotGulQhJl2So/R
	TH8KqkgBDpPHSuRRCQi/MrGBNaHpCnS4Djwjq8AsuYBILLTv4fHf4l2i/fccFzcX
X-Gm-Gg: ASbGncszcrnX80Una1W10lJJwQGg9unUHHA8GGd18Iz2FDxgTo3F3gpVCWLWBDTRT3S
	Ce9MZhgQZezg091C94JrBGHJYBmacm/5h4Zbjv5xXOdDf5BO2k3Co2km/bVHRO3WGO0uXNbkw08
	xX79M78yS9WyBoILojTQY89tEp0wWA8yYcdNoTV4NxUnnky9MIjKAyiNILUO5m+uA7IZevtFFeA
	sQm/3uNimYipOFb+qHHpSgfq3IL0bacJPaHl9Plm20IdutGzLzPGQi/uwcJIEwixx18kYRdEsji
	/7ZVmyIOH59OZZSzbTiuJ7wMcAPp4495INg6kElnqNhPrC5cXiZaiY/4VBA7dz+5Swve2zkbps/
	jIAT4F5zNbMCWXjvpjUOOS216nE5LPytyZ/ItlMCtsE8arr1cP7Wduuq0Ibl5GDULnhVCgvUHxn
	E70Tus9Q==
X-Google-Smtp-Source: AGHT+IHckZcXoO7/1/111Zg60YwNmiw3Ew6cMklTHyBH+w/ECAe0Nt0q8YEQ6Zs+U9xpoUMuXP9NBg==
X-Received: by 2002:a05:620a:a514:b0:7ff:f2ea:d378 with SMTP id af79cd13be357-7fff2ead728mr1498046285a.55.1756917839586;
        Wed, 03 Sep 2025 09:43:59 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e497a7sm133468985a.17.2025.09.03.09.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:43:59 -0700 (PDT)
Date: Wed, 03 Sep 2025 12:43:56 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/2=5D_device_property=3A_A?=
 =?US-ASCII?Q?dd_scoped_fwnode_child_node_iterators?=
User-Agent: Thunderbird for Android
In-Reply-To: <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
References: <20250902190443.3252-1-jefflessard3@gmail.com> <20250902190443.3252-2-jefflessard3@gmail.com> <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
Message-ID: <C883B982-5984-4714-B322-BB8205B47D6E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Le 3 septembre 2025 09 h 18 min 32 s HAE, Sakari Ailus <sakari=2Eailus@lin=
ux=2Eintel=2Ecom> a =C3=A9crit=C2=A0:
>Hi Jean-Fran=C3=A7ois,
>
>On Tue, Sep 02, 2025 at 03:04:39PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add scoped versions of fwnode child node iterators that automatically
>> handle reference counting cleanup using the __free() attribute:
>>=20
>> - fwnode_for_each_child_node_scoped()
>> - fwnode_for_each_available_child_node_scoped()
>>=20
>> These macros follow the same pattern as existing scoped iterators in th=
e
>> kernel, ensuring fwnode references are automatically released when the
>> iterator variable goes out of scope=2E This prevents resource leaks and
>> eliminates the need for manual cleanup in error paths=2E
>>=20
>> The implementation mirrors the non-scoped variants but uses
>> __free(fwnode_handle) for automatic resource management, providing a
>> safer and more convenient interface for drivers iterating over firmware
>> node children=2E
>>=20
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> ---
>>=20
>> Notes:
>>     checkpatch reports false positives that are intentionally ignored:
>>     MACRO_ARG_REUSE, MACRO_ARG_PRECEDENCE
>>     This is a standard iterator pattern following kernel conventions=2E
>>=20
>>  include/linux/property=2Eh | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>=20
>> diff --git a/include/linux/property=2Eh b/include/linux/property=2Eh
>> index 82f0cb3ab=2E=2E862e20813 100644
>> --- a/include/linux/property=2Eh
>> +++ b/include/linux/property=2Eh
>> @@ -176,6 +176,16 @@ struct fwnode_handle *fwnode_get_next_available_ch=
ild_node(
>>  	for (child =3D fwnode_get_next_available_child_node(fwnode, NULL); ch=
ild;\
>>  	     child =3D fwnode_get_next_available_child_node(fwnode, child))
>> =20
>> +#define fwnode_for_each_child_node_scoped(fwnode, child)		\
>> +	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
>> +		fwnode_get_next_child_node(fwnode, NULL);		\
>> +	     child; child =3D fwnode_get_next_child_node(fwnode, child))
>> +
>> +#define fwnode_for_each_available_child_node_scoped(fwnode, child)	\
>> +	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
>> +		fwnode_get_next_available_child_node(fwnode, NULL);	\
>> +	     child; child =3D fwnode_get_next_available_child_node(fwnode, ch=
ild))
>> +
>
>Do we really need the available variant?
>
>Please see
><URL:https://lore=2Ekernel=2Eorg/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen=2El=
ocaldomain/>=2E
>
>I'll post a patch to remove fwnode_get_next_available_child_node(), too=
=2E
>

Thanks for the link to the discussion=2E

I see you're planning to remove fwnode_get_next_available_child_node()=20
entirely=2E In that context, adding a scoped version doesn't make sense=2E

For my driver use case, I can handle the status checking manually if=20
the _available_ variant is being deprecated=2E

Should I drop the _available_ variant and submit v5 with only=20
fwnode_for_each_child_node_scoped()?

>>  struct fwnode_handle *device_get_next_child_node(const struct device *=
dev,
>>  						 struct fwnode_handle *child);
>> =20
>


