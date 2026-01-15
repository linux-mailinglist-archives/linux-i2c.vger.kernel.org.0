Return-Path: <linux-i2c+bounces-15203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802BD2833C
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 20:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6520C30E76FA
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 19:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F289F31A80E;
	Thu, 15 Jan 2026 19:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b="0u8wu089"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0832931A808
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506116; cv=none; b=Sv0WTVirkJnBEy1PXQCPVzuHVOADZpy6YUwRXwOKaXy10r9GMQXgF7nmcpfZZBkVk0xURC6UAd7tdU+0ooyL7EbK0AJWWRF2lRtD9ern6ufWGd20w8YU+abu5gI98tHdDiarxmm4X7ghTOUPdx2nDHkaVIrBlekp+OSLhaNz27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506116; c=relaxed/simple;
	bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hTbqFmayUmm3rS7lTzUeSoWFEFp8J0mUm9EzSX3mClLwDkwxCCGsdXTuc/DM2bcjWoEn+WB9ejuqX00npwLhAHJxtofELR8iF77rfMpzJL/mYBVggTprKzcgQUkxrGo2K+bVwaJdvgos/w0PtDwvnisa5LvIXc+zqHBSZF9xy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org; spf=pass smtp.mailfrom=oasis-open.org; dkim=pass (2048-bit key) header.d=oasis-open-org.20230601.gappssmtp.com header.i=@oasis-open-org.20230601.gappssmtp.com header.b=0u8wu089; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oasis-open.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oasis-open.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88a2fe9e200so11431556d6.0
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 11:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768506113; x=1769110913; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=0u8wu089NGUUtyJXF7iT6L297HDrZw8Mkuv7XDTwjOA3afEpEYTQ3I3PsBf5WI9CJO
         aD+W7g/u53GywRK33lDn6bIbo12xTx5dQ5EayvzGTPKsCCgQCAmLtwgXwq2PQNBeu7Ap
         H5wd2UGDcZpeyhfTOCfFJHmPurFRLpC5ehKLMrmsRDLzWjzmau8axNX9oDL/u+9BXCTQ
         v09ifB3/HSXtKInqpil2Lblq/d6ZAG0HL77Xf6Hcl5jb6C1QU3JMFn6vdtkB14H5Tmpp
         u9kuJO4XbkgAweCJaUDO61/i9+UinAntT9VGyG2o5snE4eAmlBhk03M75aSdj164EaOo
         a+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506113; x=1769110913;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVuRcIp9C9aDs7YujmRCIsJWyiCOSqmqC7FZNs5wMUU=;
        b=wgGvnheRJj/9RYFMse+2ks/ne5kd0ZjLbzyCegsvhGmhPRZTdbwxma8aY7KnSNqHjK
         x3dGd0PsRoSE7ifsoQfMVN6AJqRBtOKTWR90TV+htaGQ9nm3xGjaSMA5GqzKfFH/cl6n
         vWVqxsr1jqNnySY0aMTUb2L2+hFUpkM+op7RXyNAfimQUudEWsU89CasxGI6wJoXpXT/
         91aoaEf2KN+mBuJX8ABnYQ9hSM9niJP8d/u1GO820o+BxB8hNKgp1yBQtEUN09WP8VO0
         SxDBpvmPak62BV9GxJL7+qhBeEmJH2/bj7w01Umz9feubn1ldxULsgox7z9rfvjQkB+d
         y1Tg==
X-Gm-Message-State: AOJu0Ywie0dI8M7/Xl/5bemROFQhYIRP8b4Vr9ybPWvtqCZU8HpWpi+2
	Ymowes3lULd9CjksIj0iwpWTAr3emY8ouTjV3VS8/wm9xhCw61sMLaMeC3QJu+kNopmZSfAJArH
	JftI3GIflMnaDQFF2N1sRmfiVykufF80AtWd2u4mc7siTeOAqjLrL2KA=
X-Gm-Gg: AY/fxX5wywOqi146wKPDYYE3v/1LtQDIcSbFORQTWQkg7TsCdV0kXS8GRlbyCtqscKs
	4XOaWKp+gbwb3i94cdiYE7wdXm99eF4bDWsPk2kQYZZgjRwp3hWAWAB3/Czwsh1msBEv1/4yi6d
	/TbbX1fd4KhRo0RYn9OexUsqiitRMSh5daIubmi0AlfBeL/x8phmcPE+jrv9YPJ9N+ba0WYusnS
	zyiOgozZHE/CHir0hcwoBtxDtswtpmAaI09t0Ux6gIjQ/FYIObQ9ggcqjGz0VrMgqPsPbWkjlYB
	khVLYAqBbo649syeGd2sy5mIyJPpBxOWf0Z6zC3EBFEg7OiS6ZB1Ec1uINd1
X-Received: by 2002:a05:6214:411c:b0:890:38b4:d9ff with SMTP id
 6a1803df08f44-8942ddad732mr8891756d6.43.1768506112889; Thu, 15 Jan 2026
 11:41:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Thu, 15 Jan 2026 14:41:16 -0500
X-Gm-Features: AZwV_QjyGCCmMCB3mdeNTjuhBjyWTCKMKlzibWf0eLiMp_nrR2AOfKDcTa0M43E
Message-ID: <CAAiF600p=9c=rjiOitaMr+iGhvC-Au0q=grUq3OJ-Z_wm9Hmmg@mail.gmail.com>
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OASIS members and other interested parties,

OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01
is now available for public review and comment.

VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device
Specification.

Virtual I/O Device (VIRTIO) Version 1.4
Committee Specification Draft 01 / Public Review Draft 01
09 December 2025

TEX: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.html
(Authoritative)
HTML: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-cs=
prd01.html
PDF: https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csp=
rd01.pdf

The ZIP containing the complete files of this release is found in the direc=
tory:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip

How to Provide Feedback
OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and others, whether OASIS members or not, for the
sake of improving the interoperability and quality of its technical
work.

The public review is now open and ends Friday, February 13 2026 at 23:59 UT=
C.

Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by
sending an email to
virtio-comment+subscribe@lists.linux.dev.

All comments submitted to OASIS are subject to the OASIS Feedback
License, which ensures that the feedback you provide carries the same
obligations at least as the obligations of the TC members. In
connection with this public review, we call your attention to the
OASIS IPR Policy applicable especially to the work of this technical
committee. All members of the TC should be familiar with this
document, which may create obligations regarding the disclosure and
availability of a member's patent, copyright, trademark and license
rights that read on an approved OASIS specification.

OASIS invites any persons who know of any such claims to disclose
these if they may be essential to the implementation of the above
specification, so that notice of them may be posted to the notice page
for this TC's work.

Additional information about the specification and the VIRTIO TC can
be found at the TC=E2=80=99s public homepage.

