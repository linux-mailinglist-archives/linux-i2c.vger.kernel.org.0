Return-Path: <linux-i2c+bounces-9726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC5A4EBA1
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 19:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BA937ACE18
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 18:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8AF1FF7CA;
	Tue,  4 Mar 2025 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bFaaqw3Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA30F27700D
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 18:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741112307; cv=fail; b=YlKrYbuDq8zsPj/ZqldX8OG537FFwE68WNTDoA11evC2nKWtiMqpveXTl6P8PRp9z5NGuYgaUNBXC9z3WnHGbkpifqfMatBA4AZyLD758E+UqSkZYkVvqIxDi3mKI2U0gGoPTiCEIrZKCijdiBHDgTVsfHqBYpJG7n+roBDMWGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741112307; c=relaxed/simple;
	bh=kRjsRSUDf0KdzEYBVDI5mihVW/kQwdo7UtqqfiGH1Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ddi0p1hLsz0zgfHXgcwIE5fDWed1UBMObhcmi7xQMNnnq5q+HztzGmYCoK3DcU7ILi7kcAz0sdB2I+Clax4fiBreDjpTq0wCfKpcYqK2gtKhSEUaWkS48HaigYom4M69rLvaF9bHePNBWdDoCykGCE4boFt8kFjIqpkvc43Rr9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bFaaqw3Q reason="signature verification failed"; arc=none smtp.client-ip=209.85.221.49; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; arc=fail smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 040D8408B657
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 21:18:24 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bFaaqw3Q
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gms1PlNzG2jh
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 19:17:01 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 503A6400C6; Tue,  4 Mar 2025 19:17:00 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bFaaqw3Q
X-Envelope-From: <linux-kernel+bounces-541506-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bFaaqw3Q
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id C35B9425E7
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:12:31 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 67CCE305F789
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:12:31 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3136172E88
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361801F872C;
	Mon,  3 Mar 2025 11:07:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05791F4284
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000066; cv=none; b=HmG28Kx/K/QJiB5bA3FdE5pTsq2nzwa6KrB8QPC10PbN+RMcNtV+I+1wrTH7TqZJb88tvYzNBJGRkZeFGc97dgQ5RWQay/GFwX+2ylp10WRmW4w/UTiJSrj7Xzw7PM4pfvardp82bZ+LmnxKbf54q/LgYBKBrwBp6+Qho+alHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000066; c=relaxed/simple;
	bh=1GgecRLa2f5MkYVd5GEY2hn4u5tEWq9NVu34El0c/8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNkBSGx4+mBPCVb9vIsY9l0PlY+/jQYrn+9BOhF50K/iW4rvMu2vtAW0gz3hdTAH5PAOv3p9tdTah0BqtnzNMv21ErsWcwnd8SSHaq7Q7j4EKB+KX66T7aLvEgz63ptbqp811P0NLi9QS+DrYWEtnLIBV9zR/F2Fa4bpw+Gx20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bFaaqw3Q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2576002f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 03:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741000063; x=1741604863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR6klagFtyciqTScqCxSlheZkToLksMe/ghF+ax1bKA=;
        b=bFaaqw3QdAfnuFGuAvtD1FNPpvOGlXqwPIAePppTseM4vLJMn2vMeKzPIBtgwgdVLZ
         No2Xxe6Tj5CLYoc4y7NJVgPMh9EumBiFNamHzJPBFNqpUb11T/4dLt2Mp1pVScLvxBAP
         KGSV8EbFPhyClemSbjJatilzT7C4yXVjaezDaAS3oSlvHp5PH1X2WmycuWORbp0W1UU7
         a7w26gElvlgEjAWznMQXCXpMDjUUr9ZuLP1UQjugX2NTh7W8wvuOztrSY1lr7NlAC963
         SzbNRbgjV66bM5jb+VCc0N32ZFC1eoJR8PVVQfnBoKt5L2j65b//WYLREzLnQ3EY8fa/
         RAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000063; x=1741604863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hR6klagFtyciqTScqCxSlheZkToLksMe/ghF+ax1bKA=;
        b=VoT7pzgDf+dakqMWEhdOGq2gUH+xo8P7lSRIHMsXzJaxGYkK434wGIXKGQd/XiUdAB
         n6HUoocGTffqckVA7wKTwUbYrDdw6hLlvtZ28RE0WUnyAAW4ydwFIu5YUfaQBfe+sMYM
         eznngoD6vbZYc2EgiOGGA70hGvPplyyHtuYelAMwkzoIMQJ9flIk2VuKw7z061IFLNo7
         CIXTs24Ef3IPGjwTQDQv6JC5fnhWzosIMyKs9dtpMf8UOaMlqDERUeGMm5nAY14PxkPJ
         bjdGYj9u3dYiQI4XMWtlCJ0NO1q9qg1AfIP0jTF7777jPnqbke9C/AcfLk1IP277i4IL
         IGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMjeghk+Ya82N8cp0RlA0Yrl7JHxgEQPeQL5Km17DBvAXSc74kgw1K89QepFkNtS+KHYlWjd0NXECZWM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YylFycM3usnMSPzu8HXIlaSkwhO5YMuCyZDovvywmtA23i9gsi0
	d8fKq8DmTpEI7sya23sW9WPl2XOYuJoYyDNeIQj202KTv7z6RBBg5J1LU4O7d9I=
X-Gm-Gg: ASbGncucUGlAuYl1mJZVo3eHDPwZrl3PBEApd88aaRL6/31PH22W+FPjOpvjnUWjquB
	8Ad4qRzgdJCwAx7WMeGEWiNhZPPU5CTjIMzao8zIj9IX03Z62jxAq5ywOfxG3wTuPqgIC8msZnn
	xQJKKNjw4JfGaGjbxbqXuRd7XMhYwetchvcV3ghGSlZvqKnmUG1mF8fXBF3cq7ZlZB/6rhTjNc4
	2LzTi3pquaQVQna6jDwEtIa01CTls3tFytTPKZXzUsnM482Q5YxaCRLAkwBjvn3fdwwevlNkJPp
	lzuGsCoTMF5MNcwzHm6vDHcRNDS0mPaDEeRa4xfVMdWr
X-Google-Smtp-Source: AGHT+IFBGs8EDHlTN+81XRenAyQXyDufJuVA47cl0O3zAj0oS0wkjJQ0biMXNxnI2ZLtaTTO2C/nJw==
X-Received: by 2002:a05:6000:154b:b0:391:5f:fa10 with SMTP id ffacd0b85a97d-391005ffbc6mr4581143f8f.24.1741000061418;
        Mon, 03 Mar 2025 03:07:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6a87sm14344403f8f.32.2025.03.03.03.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:07:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
Date: Mon,  3 Mar 2025 12:07:39 +0100
Message-ID: <174100005548.29353.2871325520350905330.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gms1PlNzG2jh
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741717010.99992@MugG5nywOyMkhVEPZZfJtg
X-ITU-MailScanner-SpamCheck: not spam

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 25 Feb 2025 12:08:38 +0200, Andy Shevchenko wrote:
> These result in a very small reduction in driver size, but at the cost
> of more complex build and slightly harder to read code. In the case of
> of_match_ptr() it also prevents use of PRP0001 ACPI based identificatio=
n.
> In this particular case we have a valid ACPI/PNP ID that should be used
> in preference to PRP0001 but doesn't mean we should prevent that route.
>=20
> With this done, drop unneeded of*.h inclusions and __maybe_unused marke=
rs.
>=20
> [...]

Applied, thanks!

[1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
      commit: 51e36ca2251c5a47d8f7069d60fd07153cff3f36

Best regards,
--=20
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


