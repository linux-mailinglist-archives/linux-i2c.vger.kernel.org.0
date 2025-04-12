Return-Path: <linux-i2c+bounces-10276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA49A86A5D
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 04:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BADB1B85CB7
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 02:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA12142E86;
	Sat, 12 Apr 2025 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb6yaF2K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29BC130AC8;
	Sat, 12 Apr 2025 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744423963; cv=none; b=jvaj9JZc+5G1ziOZkh4Yab8zH4ZuCaSlvKX/a4MVs+HVPoVH4prlOvt5ehHUKneVY2TgXyY7o3F3wGaD6CnJ/H2l5SBPlgSbxMCS6SccxFd79zEAY7EAS1IiwGnyTTXuEQR1nuyv1ectjDNkDjxHYIW8Zoe5PiyYzSttrBkcNtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744423963; c=relaxed/simple;
	bh=Lu8iqy3rx8lT4muglAjEUHVncSbSu6lyMTOsGKR7PdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyiMTq+U/2BVeTtqWnAx8Pko5mi2IlVaQ1Ajv2BiRhpkRrhalczF2SPZViMQ7x+kItEuyxZ4evkZ9vDCP/BeTXqmodtmS/6ICDVa2laWwk9uqSvaJ0Q/E7g/ORx8X//KP0SE4HO2aywTB49vOGdAbUSYfisZoqOGTkLNPuKW1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb6yaF2K; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c277331eso3501610b3a.1;
        Fri, 11 Apr 2025 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744423960; x=1745028760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=njR1IHpBEagt6VkcvWGFaCp/bmUoM2oQuxofJ/zbLMQ=;
        b=Yb6yaF2Kr/bNrVxKoTUhqPYHZbpWirhL8OH4m8NNftcWiPjcX/YsUNXP/Azl//RxOY
         qM6AQrYcdQuIBz+OFKuwD4fPazVeE+Wtl+IyBdk41QBBIT9LmQgFtx0JKuhS+pdQ4N1i
         EinI5njMujT2g9mE5pzw2O+FZpRP3x4pP/oOOnxLiUzZxWPiJC48zGm/Sck0Y2sLAOZY
         8vZjiiaV8ckYHV3R41i70JQDw1byIfBb4ZFG1OMCDDlaCC3UcjFNqlJ14NnRIaMPqYUo
         sJoLeaKF/dpEjjZu0JxBjm5p/IE0dSbN2dSvg89GFb8+kru5zyg0z05yxzKz3Wd+Q7Ss
         ullw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744423960; x=1745028760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njR1IHpBEagt6VkcvWGFaCp/bmUoM2oQuxofJ/zbLMQ=;
        b=dU2MrsCe1lCs++7Mp9EdqTdn2xTDF4qZB/Wn8D6E2vvDo69BWdXQoA39vI5kOwafQR
         2+zInTgtCvlFVyZZQegjTHcJXd8Jc3ZLJgCP+YvL7oH9I4FRyhWYKFsfZT034IqbRYcX
         mRHpRQgWpfxyL/lu/KpbPJC5JABzVOcvq9g13Apnvh1fQMaWvmV5SQRNrKAUzVJFBWHS
         XueK60MJkJnYKjuGY1T+uCGEtgkoMhUc9FlE0fjmFH5Ft/HsFLgPhyZROEyqwfoXCzXr
         4j8BwQUi3raFxBwWr4eNNhvq0/Wk4rve05ZXYFoMbXhUgcc6qocHmy3WGU1q7JI4hVt1
         bvqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkSB3mA3SyZHlRlk98uv/Eu9GTXB4/JfIyJPqqflTjRrT2YrtTk23tUCMROUQvDqB4M+teK2bD5oILD8bE@vger.kernel.org, AJvYcCVZS7VDzfIsK8C9h83gxAUVZ32nqwZq9U4m4rrioY8X5JYO24h7BCZtpBOLoeVj4UJvMXDxsQv+ZC8=@vger.kernel.org, AJvYcCXK/mokJ5z9DkzwvtkhpeRUhYr/xibNp7GKQaSnxtP37hc62p1LuWChTWUJlFhxnDUlwUjV4EknWf86@vger.kernel.org, AJvYcCXeQCTSRJWj4sjqCFdGaE5b30ygc1ezIWrfRAUUUmLRxWSfVkbuhG4eCGTQDie7MPS9HNIAJ4BYJXXxbQcEWOsUtyvezg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjZtSZfiqh0nLL72lbj1VklI9mW6YtsxCb5kvePe1V5ft/0LI
	psOJdxyKmpZGPQVMijpwf6BJGTigke5l+TZZYE/wsNP33qOoAlnMToGspg==
X-Gm-Gg: ASbGncsptLtYqn56p/Od1IQM/dVcKCM6G0wL0jqSAOzPJF7T8UKilF9oCtc5XYmHn6a
	4pTEfoIVCrOCL/j8b7sffDDloKWvY3B5bLtoZyFvlpAsLp7NqJ41QYUUYGEJO+w6aSMB5Q8U4/x
	idoXvhROzrmFxCGJMOvER3UaKv29tWYLvlYbIP4FpEraIuVWu4ubXwVBye76QKuvz0/MhMUEM/8
	2zXAUAPEQBoRmtYcaxB+i5+dpVvMOzHjLAimLgd2P2mAa6MlQRYOdquBfcrqznqyDt3DZ+ibFao
	eP1Acu0AhclOhy9a0AndCchz40x6FGIylU6R/rMiD/HcefRIkkk=
X-Google-Smtp-Source: AGHT+IGM2RKlqhbuiosDyGW8RbZdJ+QL69YNYR+zcAmT5d1nLu7doccgmiV6a88ldoucGkd1G7w6Cg==
X-Received: by 2002:a05:6a20:c706:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-20179512dbdmr7758847637.1.1744423959694;
        Fri, 11 Apr 2025 19:12:39 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f10b3sm2376803b3a.118.2025.04.11.19.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 19:12:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DD10D422656C; Sat, 12 Apr 2025 09:12:35 +0700 (WIB)
Date: Sat, 12 Apr 2025 09:12:35 +0700
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
Message-ID: <Z_nMEwobMzGbG74L@archie.me>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zrq6f+/ephC5CP3b"
Content-Disposition: inline
In-Reply-To: <20250410200202.2974062-2-superm1@kernel.org>


--Zrq6f+/ephC5CP3b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 10, 2025 at 03:01:59PM -0500, Mario Limonciello wrote:
> v3:
>  * Move debugging.rst to index.rst

Do you plan to add more AMD-specific admin docs in the future? (BTW, I don't
follow v2 discussions.)

> +As there are a lot of places that problems can occur, a debugging script has
> +been created that can help test for common problems and offer suggestions.
> +
> +https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/tree/amd_s2idle.py
> +
> +If you have an s2idle issue, it's best to start with this and follow instructions
> +from its findings.  If you continue to have an issue, raise a bug with the
> +report generated from this script.

To mailing list following Documentation/admin-guide/reporting-issues.rst?

> +First convert the GPIO number into hex. ::
> +
> +  $ python3 -c "print(hex(59))"
> +  0x3b
> +
> +Next determine which ACPI table has the ``_EVT`` entry. For example: ::
> +
> +  $ sudo grep EVT /sys/firmware/acpi/tables/SSDT*
> +  grep: /sys/firmware/acpi/tables/SSDT27: binary file matches
> +
> +Decode this table:::
> +
> +  $ sudo cp /sys/firmware/acpi/tables/SSDT27 .
> +  $ sudo iasl -d SSDT27

Nit: two colons are sufficient for literal code-block.

> +To activate PM debugging, use the kernel command line option: ``pm_debug_messages``.
> +
> +Or enable the feature using the sysfs file: ``/sys/power/pm_debug_messages``
> +Constraints that are not met will be displayed in the kernel log and can be
> +viewed using anything that processes the kernel ring buffer such as ``dmesg``` or
> +``journalctl``.

"To activate PM debugging, either specify ``pm_debug_messagess`` kernel
command-line option at boot or write to ``/sys/power/pm_debug_messages``.
Unmet constraints will be displayed in the kernel log and can be
viewed by logging tools that process kernel ring buffer like dmesg or
journalctl."

> +`patch <https://lore.kernel.org/amd-gfx/20250305051402.1550046-3-chiahsuan.chung@amd.com/T/#u>`_

What about that patchset status? It was not reviewed by upstream maintainers,
right?

Thanks.

--
An old man doll... just what I always wanted! - Clara

--Zrq6f+/ephC5CP3b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ/nMDQAKCRD2uYlJVVFO
o77TAP4iqzy/7iJ7v9tLVGTueele0NWGGa1l0o+1jVvNpvdhmAEA8jHDqvDnZRct
xdsBfvURszMWB8O6XHtd0/cv0XC+igI=
=p65j
-----END PGP SIGNATURE-----

--Zrq6f+/ephC5CP3b--

