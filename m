Return-Path: <linux-i2c+bounces-12560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B6B40B34
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 18:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E57233B07E8
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D212733EAF3;
	Tue,  2 Sep 2025 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUWXTRxV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5F1314B9A;
	Tue,  2 Sep 2025 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832076; cv=none; b=nPY53T2ZYi2ODHuRUTH7K2xcz/zBqEOcKjrhdrXwa2H7dzPqsaZoGyTyn7U6lbxL2EGI1B/T4kuzwYDqLY1EGfU7eMAfSAIf5xHfY+K30llhpjm6z3IgkDnsdRAepg0A9WQBS0MH1oDN9zSHATwMStbf84z9AhYu/v/5aMmQrII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832076; c=relaxed/simple;
	bh=guzP02KmT9+LPpIUdkrPHuphKMqdYx1IWJMSk1qSlnU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NQsiLvh6QsPEvTA2GU9lvpjRCE+1oCnQO93pEwofUsvKvvh9XMeNHuI251aI2W01xMZySN7y6GCC3WA7rvjFT/glJ9fYm0u3zAyn7wKA1HsYdTAzSSVRetOMPTSdjOKSpxliVs7ur7U0c8CiDgq89eaqP+fCa6PmNN4GJrL5TcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUWXTRxV; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7209bd264f0so760036d6.1;
        Tue, 02 Sep 2025 09:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756832074; x=1757436874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EnjBvFOmyr3GnC7myEsg56KC3/4DgBJKDXj/Ea4iER8=;
        b=DUWXTRxVYj3rHI8C/AMGU8vFY5BWspAeb5VNK7Op98OKB3CoWa/T4lVTeEWVhkvj1r
         NHLE/Bntjyupzfe0ARrzJq8+yq76H2vWCCwSEJnhX8U5kgAsyvdtfbYXKWS/JdMjKt/p
         4THIAt1va8YeT7A9hi4RrlZwJ8r09DLiVzusUSf4/HTKrM5a6xjYUG1ZDGu5BAOrolBb
         HtRvC0u69aT/7o4WH6Ka5kxtrXaNVll+8dE9lP8HBoZvQaOxoG9Qfab2E5COFlNBP3m5
         oISTAY6G/Rjflc90ks4xQcOgMcM4il5wbuxbqJefTRuI/dnbmBLHnqtPK2TN03i+j785
         ZO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832074; x=1757436874;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EnjBvFOmyr3GnC7myEsg56KC3/4DgBJKDXj/Ea4iER8=;
        b=Jy8hFsu1Q1NPhUyES06XLzZbs9Cih5+bhFgmN5wOy2FXkYzz7xIlOIrhUs/6x3bm73
         LgmCeJpp5TsqtRHCEPJNNt/G5P8Ol//ozM0kBB+bHZs34auQIeLE1kCQoRRZdQGb7ZeO
         Duv7g6FhnK1ktTAdMCYvXYda8eIJDHut3JtlZWCQi4EYbJkvHvC4m6az1t9OD9BvLjiy
         fuuSM9k/hCnDJ9peKF+JiIHqsXbdMOpIaKLtnUYKKDwWU6D+t7WtxtDx35de8alqDM8t
         h8lJSO5WfzgcZbYOVpcWW3pp+uFG2is3tdPnkriN5TD0YmTnozV44Xh5Wi0A1Rw36y3e
         RIDw==
X-Forwarded-Encrypted: i=1; AJvYcCUb4Jg0eTnkA7CKfAHllXTSk0SW+gUZ3xus2eBzbehwwU2rC44wKtFvkL+PJaK6zNMl/qhyldRtS2xoB+x7@vger.kernel.org, AJvYcCUfZmvfkY1nVCKA09sIU47l849tx+o+N2tCwBhaNRTlaQ9+JEMrejaNJvRBbYdbiG4Q12FP54It9GKP@vger.kernel.org, AJvYcCVMj8hQ8OUfJjDmg6PfjN/TiMouX8L4KJvH7Z83DTCFaht+LPWjh5rdTHwXuam8S/IcyYYuRUH9TPht@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxg/IpHppY5l5O7grKr4pZdbtMnAYzQsxydYq3opvWX2kZDKqH
	SY+29+PCGzINXF9hUz1XeW3ry9O5rV91HYP8+JWmNLX1bVS0VpceEFy7iQysXvr4
X-Gm-Gg: ASbGncsJz0vEs7PWgwW+MOTJdbCAnE/EuWfhw3pwz/QPblJ7kRQwlJ9i6rPXCx0R02i
	4QMaClqtyLVc016A5UQpLncOKJ1WvZXPS/yf47EYChd+xPXgfj7Xn090jBonBrTEwWlDGxDLi9X
	Bh9fV+adKgAAS0qr8cXkvl7m3U0rifHA59uRPc4ExVzK03ybMWva9j1ToRX7nDYe/WOEhQdWw9S
	4FG9SYRhaCfywxvhFVTQ/3U7UdxtHRQTRK7PpRvb6zq0tHElz/niB4PyjB1YnRnNCzpH/qvH8Fo
	uXl9Hlyj/sDMdqwuzBzIOEUfZvdeBhdw0chx4gMLzj0gzNZ6DqjAyX6zOsv044PwDU0OEXTpJvL
	z2DXfUYHQ8PWg04f9STb1Lrrrc4SmRCfC6XJ20pEjK1F0yOJo9yj1vw45A+NoqpxRicsorHPK/K
	eBFCxNLc5YAkAHeIDj
X-Google-Smtp-Source: AGHT+IH55B2aKx3wQTamTWxHTlb0gd/ma4su7Ftwp1+lPNXFKFcPxuK7jT9nE2oxNM6Ls0cVwortyg==
X-Received: by 2002:ad4:54c5:0:b0:71b:b093:c6f9 with SMTP id 6a1803df08f44-71bb093e022mr58679796d6.6.1756832073674;
        Tue, 02 Sep 2025 09:54:33 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b59b067bsm14243176d6.59.2025.09.02.09.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:54:33 -0700 (PDT)
Date: Tue, 02 Sep 2025 12:54:30 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Danilo Krummrich <dakr@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/2=5D_device_property=3A_A?=
 =?US-ASCII?Q?dd_scoped_fwnode_child_node_iterators?=
User-Agent: Thunderbird for Android
In-Reply-To: <2025090203-epiphany-antsy-bf45@gregkh>
References: <20250901163648.82034-1-jefflessard3@gmail.com> <20250901163648.82034-2-jefflessard3@gmail.com> <9ed3743b-4f86-42d3-94e0-8a720526dce4@kernel.org> <85D46ECF-B4A6-4C78-A4DD-0785FE58B2A3@gmail.com> <2025090203-epiphany-antsy-bf45@gregkh>
Message-ID: <90211F66-7E6D-4C37-8452-EE88B1F94F53@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 2 septembre 2025 00 h 50 min 08 s HAE, Greg Kroah-Hartman <gregkh@linuxf=
oundation=2Eorg> a =C3=A9crit=C2=A0:
>On Mon, Sep 01, 2025 at 02:16:35PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Le 1 septembre 2025 13 h 48 min 14 s HAE, Danilo Krummrich <dakr@kernel=
=2Eorg> a =C3=A9crit=C2=A0:
>> >On 9/1/25 6:36 PM, Jean-Fran=C3=A7ois Lessard wrote:
>> >> Add scoped versions of fwnode child node iterators that automaticall=
y
>> >> handle reference counting cleanup using the __free() attribute:
>> >>=20
>> >> - fwnode_for_each_child_node_scoped()
>> >> - fwnode_for_each_named_child_node_scoped()
>> >> - fwnode_for_each_available_child_node_scoped()
>> >>=20
>> >> These macros follow the same pattern as existing scoped iterators in=
 the
>> >> kernel, ensuring fwnode references are automatically released when t=
he
>> >> iterator variable goes out of scope=2E This prevents resource leaks =
and
>> >> eliminates the need for manual cleanup in error paths=2E
>> >>=20
>> >> The implementation mirrors the non-scoped variants but uses
>> >> __free(fwnode_handle) for automatic resource management, providing a
>> >> safer and more convenient interface for drivers iterating over firmw=
are
>> >> node children=2E
>> >>=20
>> >> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>> >
>> >Thanks for adding a user and splitting it up (Andy was a bit faster th=
an me :)=2E
>> >
>>=20
>> Very welcome! Thanks for reviewing=2E
>>=20
>> >> diff --git a/include/linux/property=2Eh b/include/linux/property=2Eh
>> >> index 82f0cb3ab=2E=2E279c244db 100644
>> >> --- a/include/linux/property=2Eh
>> >> +++ b/include/linux/property=2Eh
>> >> @@ -176,6 +176,20 @@ struct fwnode_handle *fwnode_get_next_available=
_child_node(
>> >>   	for (child =3D fwnode_get_next_available_child_node(fwnode, NULL)=
; child;\
>> >>   	     child =3D fwnode_get_next_available_child_node(fwnode, child=
))
>> >>   +#define fwnode_for_each_child_node_scoped(fwnode, child)		\
>> >> +	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
>> >> +		fwnode_get_next_child_node(fwnode, NULL);		\
>> >> +	     child; child =3D fwnode_get_next_child_node(fwnode, child))
>> >> +
>> >> +#define fwnode_for_each_named_child_node_scoped(fwnode, child, name=
)	\
>> >> +	fwnode_for_each_child_node_scoped(fwnode, child)		\
>> >> +		for_each_if(fwnode_name_eq(child, name))
>> >
>> >IIRC, your first patch mentioned that your driver series would only us=
e
>> >fwnode_for_each_available_child_node_scoped()=2E
>>=20
>> You are correct=2E Next version of TM16XX driver patch series will use
>> fwnode_for_each_available_child_node_scoped()
>>=20
>> >
>> >And this series adds a user for fwnode_for_each_child_node_scoped(); d=
o you also have a user for fwnode_for_each_named_child_node_scoped()?
>>=20
>> No, I haven't found an existing user that requires the scoped version=
=2E The only
>> usage I found of the non-scoped fwnode_for_each_named_child_node() is i=
n=20
>> drivers/base/property=2Ec in fwnode_get_named_child_node_count(), which=
 doesn't
>> need to put the fwnode=2E
>>=20
>> I included it for consistency since the header defines all three non-sc=
oped
>> variants, but I understand the "no dead code" policy concern=2E
>>=20
>> Would you prefer I drop the fwnode_for_each_named_child_node_scoped()=
=20
>> variant and submit a v4 with only the two variants that have real users=
?
>
>Yes please=2E

Understood=2E I will do so=2E


