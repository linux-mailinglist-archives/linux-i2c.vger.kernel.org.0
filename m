Return-Path: <linux-i2c+bounces-12550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47006B3EDAC
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 20:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017FC3ADE0F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 18:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D8B3064BB;
	Mon,  1 Sep 2025 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBO5+pPf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA59E63CB;
	Mon,  1 Sep 2025 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756750600; cv=none; b=JsNZCwEUAhDgXkUK5trl8rA3kh3X1ifqQTOE5lclp1cv0ZcoAzpOA5MJJn3/RvDu3QNhAIj7vyssestUjnWNZqNQP1aCGTlehuIXbe5gBWH48lsk7nCfgcYIoqQ6QTXi1A7xWshEH9S2RRd1h6edGKIJKZjdcvoCEWnAgLMy9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756750600; c=relaxed/simple;
	bh=xQZpqgGuo1rqV4Rdfm5jlL2ns9b1cQQiaRQ5UVvEFWU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gPPJcuIX1nncXIkN/j9Jev8vqOwHroMYaOFRVQWBRD0E2E883F50VSCKJLMGdtkD+3lB5NVK2SkmkaJJygF0Qq07jvZwCbcN9ky7oMo0ihWHfV9j7mjFlMFsCJzGJw95D2KeKhXwX3z29Mphz+lT+PxzkqiaSW7I8M0iJQfsGrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBO5+pPf; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7f7edf7621dso390226685a.0;
        Mon, 01 Sep 2025 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756750597; x=1757355397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xn9IC3BS1kDv/1fQ9xQj+9fzHBMt4uG+26oEBt3SZB8=;
        b=aBO5+pPfaeU4idRlavni/gekyCvUmDQjBNi1Bc4DWECa9SjpRM89IUYgqOvU3Dl2Zf
         /nG/kwvFt+PJN+1ZQGNM6T6i0aaKlXgSuLbsIbjED997C7pm9PPqC4vzz/9g0Pt/X0DW
         n3Yyrcg0SaFAJg45PSHY3RxmGUq88hANyuVJU/Iq44z39XDKTRVLXAEij2iEN7n2UjVl
         dR+vEAqALwDNEibKRU/ZZxLLgxJmMkOMXNp2kGxOpFBJR+xfcPec4wWrVbY1KL0EuNb7
         7Dmre/+0uhk3zXqdQLxOfAPqxu8kBNxLXjn4aQ5UvQJSukhNl1tnSwZA3yYquZR9F3rx
         KugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756750597; x=1757355397;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xn9IC3BS1kDv/1fQ9xQj+9fzHBMt4uG+26oEBt3SZB8=;
        b=DEjfhyJAt/EnC2i/QES80QcJbC9QJwprcYZReW4U9bk59c6M4UqZECRZoiwowtXpPK
         e23S1iU/8o6RGpU5RW35iZ5DkYCY/LdGilaMIgtDRQztcWNFKmdOKJEv07PUjO0DcB0p
         qbiuQQkCKcAyTUfeJ279MBie/qMs/O09KyXarc3LV/yVjMV8uCiYv5eM2+x7QDIopmQ7
         qr+LlEZOPrZcTdRcMjgyYEsyQZVUDDkYaXeoP0LwiTVeCBTINjDlrBcSYPkFa/8TTCVm
         pYbzldpBLi/kdJrBlmR0sG25vJ0OXJPMpoEplRpIW13CsEWloSoAnxG1vXv3giLtTVNu
         N5/g==
X-Forwarded-Encrypted: i=1; AJvYcCVknRX7C64PvfKLeaYgz6YowhS8+ORureEtUjp431WcvHpZgAG8rHO2jahcN4P7vSC7UfbAPwhLl76xnT0U@vger.kernel.org, AJvYcCXPPvyoSu9iuVQO3DZLW/b4tqpr0MpTJ6/XDWyBAKDAGL/TlOy3qXZk52A4UgrRgEHJSXuJnQv/1Vs7@vger.kernel.org, AJvYcCXUnVnOLaQZkVr7VqBS+bN53yUWYFiTwXQBYJ/EJ9eq9/ey83H+nHAlSU3R1R8JlzGdvGelQP3PyIDj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ug0pFMNd0Hi07l8c0QEPqpMZyoKHRofFNgKsptI6uWg/i0v7
	GhLbExlJT1Ragv0Cx0pKF8Lmz6K7Xji82JGRDjfNzprC6lrMMbDUjlvA
X-Gm-Gg: ASbGncv5vSv5oMJwe1X7R/GgkuhK1wlG+Par0T+637TqIR9vCwnAOG0oSv3p+3HYU6e
	oFrin+0FyuvifOwi6VhPR7eHX55yFkaaXxSSh/8SDTib+KaOZ8fdXdfDff4G0mIIkjC0Mj202DY
	3lcnJ9Mp2ZM7CSW6mjN9uA7HD/OHCQ4QmI9llJxfwGrzNpq4MLe/FQxWCvHv58S5zh3jR8soPMz
	aLW0UyeUo6ukvDA5nQQW7e0/KD5PkcobQe7q2bFhb84UzQt6vEescg7GGBRTUxAQIgwtbZOaavS
	uEbVF7eQJz4rgZCyuC63bAzs7TQKCTDto5Mr+CSEgHWNKWeBpPfDnKZemo6/l9Sj5XObp13APec
	qmsQIAJtpE8LYxPi/Avk5L+uP9t2MVSZS32ed3ra7P+EZG+uvkq9yLWV+HYSs0Rt7/6GaTUzxjj
	UZdn/NpQ==
X-Google-Smtp-Source: AGHT+IE0DbBpIx9sh6AjpohVLRgfreif5ibZfumHkE7neAos5oRj2ppwaaA/l71seKMtWeE5VqjcXw==
X-Received: by 2002:a05:620a:170e:b0:801:2d1a:ab1b with SMTP id af79cd13be357-8012d1aad5emr772775285a.22.1756750597301;
        Mon, 01 Sep 2025 11:16:37 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14478510sm688381785a.35.2025.09.01.11.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 11:16:36 -0700 (PDT)
Date: Mon, 01 Sep 2025 14:16:35 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/2=5D_device_property=3A_A?=
 =?US-ASCII?Q?dd_scoped_fwnode_child_node_iterators?=
User-Agent: Thunderbird for Android
In-Reply-To: <9ed3743b-4f86-42d3-94e0-8a720526dce4@kernel.org>
References: <20250901163648.82034-1-jefflessard3@gmail.com> <20250901163648.82034-2-jefflessard3@gmail.com> <9ed3743b-4f86-42d3-94e0-8a720526dce4@kernel.org>
Message-ID: <85D46ECF-B4A6-4C78-A4DD-0785FE58B2A3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 1 septembre 2025 13 h 48 min 14 s HAE, Danilo Krummrich <dakr@kernel=2Eo=
rg> a =C3=A9crit=C2=A0:
>On 9/1/25 6:36 PM, Jean-Fran=C3=A7ois Lessard wrote:
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
>> __free(fwnode_handle) for automatic resource management, providing a
>> safer and more convenient interface for drivers iterating over firmware
>> node children=2E
>>=20
>> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail=2Ecom>
>
>Thanks for adding a user and splitting it up (Andy was a bit faster than =
me :)=2E
>

Very welcome! Thanks for reviewing=2E

>> diff --git a/include/linux/property=2Eh b/include/linux/property=2Eh
>> index 82f0cb3ab=2E=2E279c244db 100644
>> --- a/include/linux/property=2Eh
>> +++ b/include/linux/property=2Eh
>> @@ -176,6 +176,20 @@ struct fwnode_handle *fwnode_get_next_available_ch=
ild_node(
>>   	for (child =3D fwnode_get_next_available_child_node(fwnode, NULL); c=
hild;\
>>   	     child =3D fwnode_get_next_available_child_node(fwnode, child))
>>   +#define fwnode_for_each_child_node_scoped(fwnode, child)		\
>> +	for (struct fwnode_handle *child __free(fwnode_handle) =3D	\
>> +		fwnode_get_next_child_node(fwnode, NULL);		\
>> +	     child; child =3D fwnode_get_next_child_node(fwnode, child))
>> +
>> +#define fwnode_for_each_named_child_node_scoped(fwnode, child, name)	\
>> +	fwnode_for_each_child_node_scoped(fwnode, child)		\
>> +		for_each_if(fwnode_name_eq(child, name))
>
>IIRC, your first patch mentioned that your driver series would only use
>fwnode_for_each_available_child_node_scoped()=2E

You are correct=2E Next version of TM16XX driver patch series will use
fwnode_for_each_available_child_node_scoped()

>
>And this series adds a user for fwnode_for_each_child_node_scoped(); do y=
ou also have a user for fwnode_for_each_named_child_node_scoped()?

No, I haven't found an existing user that requires the scoped version=2E T=
he only
usage I found of the non-scoped fwnode_for_each_named_child_node() is in=
=20
drivers/base/property=2Ec in fwnode_get_named_child_node_count(), which do=
esn't
need to put the fwnode=2E

I included it for consistency since the header defines all three non-scope=
d
variants, but I understand the "no dead code" policy concern=2E

Would you prefer I drop the fwnode_for_each_named_child_node_scoped()=20
variant and submit a v4 with only the two variants that have real users?

Regards,

Jean-Fran=C3=A7ois Lessard


