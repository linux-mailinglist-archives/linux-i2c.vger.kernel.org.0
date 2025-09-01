Return-Path: <linux-i2c+bounces-12541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF576B3E69C
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 16:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00066167D00
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 14:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857A331CA71;
	Mon,  1 Sep 2025 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG6+G0N9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982A1A9FB9;
	Mon,  1 Sep 2025 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756735522; cv=none; b=pGITd0dNnTB9Z5UkglWjXulR9tPfyEUOiWh26ZntmuhRSohjT1sXSew6TBt+7XRHaurqJRDhifjK4qDwQC7oLGWEg2/Zw+VZJEUxpvkx05VWz88CikU2tPb846lIU37GbOPWRzaKwjBhxugcWu+MaNLVsYs3lQUM45dMiefL1a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756735522; c=relaxed/simple;
	bh=0SXyRoc0PVZzSH0kuylNpat/C4zVabireo0NbOz5nfA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Esihy6D7OyBCTzvBrLhffmI0z5j7dWW3H14LXWL9a7t4kan6+rn3IiNIYzoyCiSWmpY2TU/Rxv4wV/40ZuRMiBfGn38CgZryZrv7tZJwL/F2tP7CB19VEtHyVNAqkCtm91PCkU84+HwtckLvrauw+AQl9rbRN4bWKIkokxjcwRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG6+G0N9; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70df91bdc53so36213526d6.3;
        Mon, 01 Sep 2025 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756735520; x=1757340320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0SXyRoc0PVZzSH0kuylNpat/C4zVabireo0NbOz5nfA=;
        b=iG6+G0N9Uz2iIpvRPiZ78sbtOGETPnyFSPYonxtGiiBytacOLuLB7oRAYzfWoIU6lo
         N9vX5YUj9OoVwnXroi7czDgk9e4ANH0FfTje9/lO5NAmof0EHb3AF5s/nfEhAGW1ttl0
         yoek3pJ9IZAE3YrRoN84G3ZIQ2KkVPJkvmeixDu50Xo2N+ZmaK6ZAz2MM9CMhu/CjjVM
         bu2T18ugPzBFb3L+AaZKROjVYzqwhXB0sioTZKPvHzFY/Vcjq9tovb7tfiixtdkmiiuR
         W44o3uiIPoRvZqa7hJNTAUR4MrzSfSQ/TPrltQ9bJ7d12xQcLOgyirFuVgI/yLVsGEOM
         IQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756735520; x=1757340320;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SXyRoc0PVZzSH0kuylNpat/C4zVabireo0NbOz5nfA=;
        b=nMdLE5SqYZuVjN3lFK6BxBP6Ioe+dArdIXe7Tj7pn2fmbsVNDpIdlW/fNUk3U4Pseb
         qpNvv4NmsJBP1voEBxT1bJwn2uHXIHnO8YMFm8l1bvuAMgn3rL1pD+2Nckx3gssCzyAW
         hFGDu+4yu+iXSdRtDXRIGaZaS+0AcyPXjElMvdcenB04TpBlf7bg7jIN6pUFCC3iUd5u
         9eGrNp6ztMhss/w5IPEymjmh3Yr3fwAXGeOj873mkyRbOfpKkpZX8mQdbQOhg5UzLkSU
         JUFla26SiSS2fRMvKWqKoxbdaJSH3KLvXDcTHh7iZuJZ1VWhq57W/B2LVsmN7piFuGNZ
         KHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEnE4wE0J1VceXKbqdoLIuWRgyBwZzMmLhbMV/O/N3Sw1MN2X/HhETRaArDcVVbJohhsF4unu0Vcie@vger.kernel.org, AJvYcCVMpQhk75alWUcUD6fGH08cI4M6rwtzTexFLI2rjWpoGlDPcG/rfDAgUw3gDhmJJ/xmgvquVBf7qxwl6yki@vger.kernel.org, AJvYcCXSea9A+/VZdJo29jLHt7/VDLrA/j5sQyQgXxsf1ZBn2NMvUmLNn7MdGXTa92OJz8ejh6ETs4Evvljh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44SqlK5Za9f4uWIijhZbyQbXaNrsBOOi0mYsU9cFlNaE/j/W7
	sgM/v4mXouCwQ4EHyDYYaAiCJzK1qbzn7+07Lgt56D4KbozeYTxrO3a0
X-Gm-Gg: ASbGncta9+za2IIHv1JbDaef4yuUVv3glG/jqjpLcZqEECkrHeX19CIsvV5zH1inQ+S
	TROeNqAfEC79z1WcV33LVPOprmfb3oglki3aKZD+Ieh4jNtxtzGuAkkPF2p8DBQciHaeg8zctnf
	fN+VqHhjdeFP5klgJgIcAO7YpsCqt1SFfCLEip3Af5GRGdCzT8w5N3psk+y6OQWpni2+3qanKiu
	xble0W0LU2v4Uor+JvYea6qQeWIJ9VJziAWHQFF5E/jB3eYEWgTe7G5TSlRO6iHp/V1fnQyujfa
	ORjHqrUGIahYFg8d4R28Iz8PJUTAlVvYdLVZRkpE6A4/FFCBJ7JFxvtvlOmKf76UVvAGpR0ZUyo
	hULC8GafZT6ZTOCJksXZ5nJ57W/P1U4s5g8enE6OQPOMot9ROOdSIo5FxmZZZgZGeCMajQDgfk7
	8RssC/OGiP8rYtPs95
X-Google-Smtp-Source: AGHT+IF2Z3v4CHdi+m7ZVvwqS5nGF2C7sXOE7F7MfbO+kO1t2ToLpJn/OktjnUfCTCysup0d7psM/A==
X-Received: by 2002:a05:6214:402:b0:70d:ff3a:f981 with SMTP id 6a1803df08f44-70fac894588mr84860716d6.37.1756735518762;
        Mon, 01 Sep 2025 07:05:18 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b1e6asm39689796d6.59.2025.09.01.07.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:05:18 -0700 (PDT)
Date: Mon, 01 Sep 2025 10:05:18 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_device_property=3A_Add?=
 =?US-ASCII?Q?_scoped_fwnode_child_node_iterators?=
User-Agent: Thunderbird for Android
In-Reply-To: <aLVk8RutTYuRbEfL@smile.fi.intel.com>
References: <20250829130010.12959-1-jefflessard3@gmail.com> <aLVk8RutTYuRbEfL@smile.fi.intel.com>
Message-ID: <F334F2C9-F0B6-446C-9A32-E11D6A7B3285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 1 septembre 2025 05 h 18 min 41 s HAE, Andy Shevchenko <andriy=2Eshevche=
nko@linux=2Eintel=2Ecom> a =C3=A9crit=C2=A0:
>On Fri, Aug 29, 2025 at 09:00:08AM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add scoped versions of fwnode child node iterators that automatically
>> handle reference counting cleanup using the __free() attribute:
>>=20
>> - fwnode_for_each_child_node_scoped()
>> - fwnode_for_each_named_child_node_scoped()
>> - fwnode_for_each_available_child_node_scoped()
>>=20
>> These macros follow the same pattern as existing scoped iterators in th=
e
>> kernel, ensuring fwnode references are automatically released when the
>> iterator variable goes out of scope=2E This prevents resource leaks and
>> eliminates the need for manual cleanup in error paths=2E
>>=20
>> The implementation mirrors the non-scoped variants but uses
>> __free(fwnode_handle) for automatic resource management, providing a sa=
fer
>> and more convenient interface for drivers iterating over firmware node
>> children=2E
>
>The problem is that these two are not coupled, means there is no need to =
send
>a single patch, so, please split to a series of two=2E
>

Understood=2E I'll submit v3 splitted in a series of two=2E



