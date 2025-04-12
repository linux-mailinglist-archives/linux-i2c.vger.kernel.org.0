Return-Path: <linux-i2c+bounces-10278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFFA86A67
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 04:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE644A5264
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 02:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7874E143736;
	Sat, 12 Apr 2025 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkJUwkkb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF032D7BF;
	Sat, 12 Apr 2025 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744424930; cv=none; b=I5q1pZP9b9QGMDyeUSy5XBJ07d1jTPakHQhID0CBXBl7rS/tkXwDa75cuuVkOVnoygbJ16DPl0NUe/BMG4cmNuGOIJmaqmhBqKGo9LqBGKNrCcNDxxTOqEK73cOxqt+v46ksUTbTtXEQy+oDpXsvftQScpxsjf1b5McW8YL9Q8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744424930; c=relaxed/simple;
	bh=+uB0/KeWoS+78o/K4+P1lOYb8Brc3GUB6FoOcaDAEb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQzlYTsR0arJD3lL07XTIOCMUVFFPuSKPtKUxAvjfnt0t4UBt7t9eYuDgQuKI8WhLq1FwB6rByi2rlDBXPFSXbghIYQcpRc4mpT8cCMTVL1LCnFrBqkD+3xGrNOeRJSA18gYxWBMPoYww9hyDOV4ZOh68Lvzw3aZa1zRiZYCQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkJUwkkb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fb0f619dso28777515ad.1;
        Fri, 11 Apr 2025 19:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744424928; x=1745029728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uS59NBreB8JVw6WZXaddYSZve8l7pZ2vm6Mp80Lo0qg=;
        b=HkJUwkkbRtJ3IbRpItdTFz0VO9n7Qbei6hhAASZp+jrbbvn8dqFSsoRc0X/ESg2AAa
         qCCCRfCcM40C90RKK7ARvdix90ZuKv65/gIZPJRKIkcIWCFbqFxGH9ok8ycluNV0DdGC
         N+EI8nqMRzNxLIjUQU8JEPIbG6I6JeN4l/8uk10EkMPslsxYasmlr+Da6LdvEUHM2qyg
         QK2UAUbJ+INwknegS0dGKYPDF3Fs01D/lx+GbA2BJhCtHqnsKh9kBCJT9MYzz+9w76LE
         gk7SA0cnma3LGEmWqVhV2Js6OR5r7G7v3zlerUvef4wvw0USTBBolEXvV0Yt3WYOTbNu
         rFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744424928; x=1745029728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uS59NBreB8JVw6WZXaddYSZve8l7pZ2vm6Mp80Lo0qg=;
        b=Wsjtco6t8+26umMOq1qlmMJWo8h0OarHIqfA0JqlVLuTQffrN6paSu4ogivDVK9Uot
         0RmCwZyiNYN2ixNK5dLQE2vSKhQFJoJvR41GS+rVrd8CUD4ByfmTTlWiKxlFmYxwQnC1
         0pm9Whow0GgMMena9UBvcxBvCVMGDtuZ2l07lTRXxBcaXMyTbSvlnvA6gm+tvkVWYxt0
         nOm09h7fO04aZQREV4tm08UPKgQKTNGbvfI+4nDjT+zGCA5zkG/qcFMyiaok7rVytZEi
         ZgwdRM/l6mXU9HlYT/XvmS/d9TYA+n1jAVUvndqPu752nQDcQTtt6d5RCftR6R8gt45g
         tYwA==
X-Forwarded-Encrypted: i=1; AJvYcCU1GSpXbKeTI7k5LtJnxhEJtOFixKRM/ZsUhSioNVyfcBduq+vurMAxj6dY3eHxKDORqeyay/CoacLh@vger.kernel.org, AJvYcCUMaHN7TO/Q3NaI4edeFdRqXqKxecL8lTZ4utqjaWVoSCdSU6EjmD/IXmfinKaDUdLs/txDOGp2Qjc=@vger.kernel.org, AJvYcCVcUtl8umfRP01qBwoyeKR/HesCBz9HEOy2mE2aQgEXv7Y8eC2/uuy3t9mWpe0nCIZLI6TYxPNC06NEXmZHhYlKQT998w==@vger.kernel.org, AJvYcCWnDjHuAHEBh4wPBq+9UOCcjmdMKOQIe5cuAYbcvkW6UjewNneQtOVnzgV0wZfFBE7rBmvcq86P5jx7ny49@vger.kernel.org
X-Gm-Message-State: AOJu0YwcaroZTSVoULrMjIGkEe0SENiYqK31Y5T1h+WjnX+5AzAWe6Pq
	PV/jDzK0ypr5D529FKX2uLeio1MERvhlxcp8DbT6lRGYBnxjr8zn
X-Gm-Gg: ASbGncsn1E+6zisUfDZHZCCWvqzpZ5m8y73PhmDG1p6BoI0LJwSgFhOcMek+LKxQb+x
	hfcjVTx/qMwH05n4k/OLD1jbbzlEblNolvE3lA7Y/OFRVTTE4EFu1ZgqkhuPg3JzEGDPjSaIwb/
	uJUfiS4AqoV50TPWUeik4Ltno1w0hXoz7/FyCQlnrQFcKrbeGAcCKJXawpegrifzI6yQm0wrs9O
	iOklN+xCKSKEb+FE7w/+TKmk7p8KXZ6wEQts7ysnygSQQbn+/Po2SsjfHdTGxYgeN6BqX+NvYKV
	x/C6XEaW16UQ08NftJh3tvMFdtg3ATbhUbd5iiLZ
X-Google-Smtp-Source: AGHT+IF7yQgtxx+Pvoj+nBOJQAO+OSo9hSesRaYvYmdz+vl6sbpTrhSzTeHhEoT89B0HPOGTeKZpFQ==
X-Received: by 2002:a17:903:2308:b0:221:331:1d46 with SMTP id d9443c01a7336-22bea495302mr66673465ad.2.1744424927728;
        Fri, 11 Apr 2025 19:28:47 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7badb24sm58027815ad.105.2025.04.11.19.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 19:28:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id CFD86422656C; Sat, 12 Apr 2025 09:28:44 +0700 (WIB)
Date: Sat, 12 Apr 2025 09:28:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
	"open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
Subject: Re: [PATCH v3 1/4] Documentation: Add AMD Zen debugging document
Message-ID: <Z_nP3FGEZzvRf26g@archie.me>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-2-superm1@kernel.org>
 <Z_nMEwobMzGbG74L@archie.me>
 <8497954e-38de-43f5-b3e9-f354c308289e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZEyrUDEPnAmvIh5K"
Content-Disposition: inline
In-Reply-To: <8497954e-38de-43f5-b3e9-f354c308289e@kernel.org>


--ZEyrUDEPnAmvIh5K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 09:19:09PM -0500, Mario Limonciello wrote:
>=20
>=20
> On 4/11/25 21:12, Bagas Sanjaya wrote:
> > On Thu, Apr 10, 2025 at 03:01:59PM -0500, Mario Limonciello wrote:
> > > v3:
> > >   * Move debugging.rst to index.rst
> >=20
> > Do you plan to add more AMD-specific admin docs in the future?
>=20
> I don't have any others planned right now.  That move was because I notic=
ed
> a toc warning with how I had it structured before.
>=20
> > (BTW, I don't
> > follow v2 discussions.)
>=20
> Don't worry; documentation hasn't been talked about in v2, it's all been
> discussion on the S5_RESET_STATUS.

Understand.

>=20
> >=20
> > > +As there are a lot of places that problems can occur, a debugging sc=
ript has
> > > +been created that can help test for common problems and offer sugges=
tions.
> > > +
> > > +https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-to=
ols.git/tree/amd_s2idle.py
> > > +
> > > +If you have an s2idle issue, it's best to start with this and follow=
 instructions
> > > +from its findings.  If you continue to have an issue, raise a bug wi=
th the
> > > +report generated from this script.
> >=20
> > To mailing list following Documentation/admin-guide/reporting-issues.rs=
t?
>=20
> Actually I prefer them to drm/amd with the s2idle bug template.  I'll add
> this detail.
>=20
> >=20
> > > +First convert the GPIO number into hex. ::
> > > +
> > > +  $ python3 -c "print(hex(59))"
> > > +  0x3b
> > > +
> > > +Next determine which ACPI table has the ``_EVT`` entry. For example:=
 ::
> > > +
> > > +  $ sudo grep EVT /sys/firmware/acpi/tables/SSDT*
> > > +  grep: /sys/firmware/acpi/tables/SSDT27: binary file matches
> > > +
> > > +Decode this table:::
> > > +
> > > +  $ sudo cp /sys/firmware/acpi/tables/SSDT27 .
> > > +  $ sudo iasl -d SSDT27
> >=20
> > Nit: two colons are sufficient for literal code-block.
>=20
> Thanks.
>=20
> >=20
> > > +To activate PM debugging, use the kernel command line option: ``pm_d=
ebug_messages``.
> > > +
> > > +Or enable the feature using the sysfs file: ``/sys/power/pm_debug_me=
ssages``
> > > +Constraints that are not met will be displayed in the kernel log and=
 can be
> > > +viewed using anything that processes the kernel ring buffer such as =
``dmesg``` or
> > > +``journalctl``.
> >=20
> > "To activate PM debugging, either specify ``pm_debug_messagess`` kernel
> > command-line option at boot or write to ``/sys/power/pm_debug_messages`=
`.
> > Unmet constraints will be displayed in the kernel log and can be
> > viewed by logging tools that process kernel ring buffer like dmesg or
> > journalctl."
> >=20
> > > +`patch <https://lore.kernel.org/amd-gfx/20250305051402.1550046-3-chi=
ahsuan.chung@amd.com/T/#u>`_
> >=20
> > What about that patchset status? It was not reviewed by upstream mainta=
iners,
> > right?
> >=20
>=20
> At the time I wrote this document it wasn't yet merged.  It's been since
> merged, I will update to the commit details.
>=20

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--ZEyrUDEPnAmvIh5K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ/nP3AAKCRD2uYlJVVFO
o15qAQCHblhM69t0Xc0j/spdbJnAlpiGhGiV2ZAWomX+adiGKwEAuY6uI/j1royt
FWMMMFRVStGfBo4HLqzUWcimkOK6dgM=
=yv/A
-----END PGP SIGNATURE-----

--ZEyrUDEPnAmvIh5K--

