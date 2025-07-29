Return-Path: <linux-i2c+bounces-12070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2E6B1532E
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 20:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24B7618A7757
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 18:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF2F24BBE1;
	Tue, 29 Jul 2025 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="v9dQ92DX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276A31F4CB6;
	Tue, 29 Jul 2025 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753815383; cv=none; b=gssGV7GHZehBAKueHtZLF2Id0FS2cRIOX4O+A3zTab5tvwH6jgOhDV0Hmb0CCVGVB/wLhPEkXfVoG3KfvpOkEbS4G7sMIEwFakhNDt7X5FyVMzNUiI/6DcV7nkrUhnRinClj+UhRqNf97cjNgsQHSxnDuUvHf3DwfPqNfvhNXbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753815383; c=relaxed/simple;
	bh=G31hp13BsxqK0L6P1wGsiaKyxFaG31iYQbcTnBP6pNo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nd9QbMyMTQehiQeGJnPVQEi7WImmjti28w70HbLDIEz6fzipQttbAFx+OV6XFjQuynbeuAaYCv3exAJMADQ04d8IP3NVltqKMVDkSz0BClkzlCc2g1AUkWtnuSkuf5kTptwI8hZ28uZWtk+KjA3XqZ8X5BYX0O7l9k8g04Uy+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=v9dQ92DX; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1753815373; x=1754420173; i=markus.elfring@web.de;
	bh=G31hp13BsxqK0L6P1wGsiaKyxFaG31iYQbcTnBP6pNo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=v9dQ92DXwDh8OsS2uSqUIj2UOPk0r4PUJB2qvZfQK/Nj5MstHq6RoXTQ+arVIOAV
	 GM0jEOnxVmwwVNBwZRK6bPBxwOOCXNNgv7Xma4ULgHa3WxGjysQeIBdcxJm3+xiJ3
	 qhDawyEajmum4UTHzEyb9KuvkCzse/6JrdAW+tbDj1TZo38v/EMU9fuOtST4vfKJH
	 5clKN+UE7wmqKj7VGMcwx2vvRLFmDMGE6OtiK61fWYoqloT2GIIppzQgjiI/E8SgP
	 8Epi0sF6wtt2kwYqU6mJkmBMF9kz8ZlfKDn1eUdQCl7JHJFEzHLCjExlDYP+pEODe
	 5xsi7EpimayzCvSqCg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.201]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPZj-1v2bTY22t7-00WVTI; Tue, 29
 Jul 2025 20:56:13 +0200
Message-ID: <27916016-674b-476e-99c4-a5f7d53632a6@web.de>
Date: Tue, 29 Jul 2025 20:56:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Elad Nachman <enachman@marvell.com>, linux-i2c@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>
References: <20250729084523.3220002-1-enachman@marvell.com>
Subject: Re: [PATCH] i2c: mv64xxx: prevent illegal pointer access
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250729084523.3220002-1-enachman@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RNUH8dQXIPKPyusYeJ2aSfmoeL42Al2k8PjYD6dQyQBN6MWyome
 hJX297uyTLUMj9Sx7qZlIVJGxu4NKFVoE+2bUcI2wgMiafe1byyD/H/FyYae/6zOLrmKHQX
 VYh9Xz4ItwMebFV+k0T+HvINkmnaun2l7BvqxFxVee+RU+1BCGkac9f6naOyqiGR+Fg3KcC
 fUqQXs//dpgZRP16Ks8/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:joHjxbsb4Io=;mcvbweLmtp8Ewfv+iRIin4Kh2rs
 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
 Qg==

=E2=80=A6
> Add check to verify buffer pointer is not NULL before
> reading or writing the buffer for additional TX or RX
> operations.

You may occasionally put more than 53 characters into text lines
of such a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n658

Regards,
Markus

