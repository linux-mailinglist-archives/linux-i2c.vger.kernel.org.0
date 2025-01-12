Return-Path: <linux-i2c+bounces-9035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84808A0ABA6
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 20:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93CEE1886594
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 19:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283031C173F;
	Sun, 12 Jan 2025 19:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="UuP+/gg1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B514A0B3;
	Sun, 12 Jan 2025 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736709037; cv=pass; b=FetfekqLZMU5rZuqV6elRPrk7Ry2i8oruaI/khmCuCznZtdHJ5QdnRq1a+fBW/rlyCDEoDzvc1Il7xoMTl8Albgo0fs3x//J7ZEOQJPBoqRp3LjmybTLnypPQudLFXx9Q8DX/iEfjHBa5kTvO8rwluf4O9BHWlA44+/zwr1cWLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736709037; c=relaxed/simple;
	bh=6hujTHHtjiLUWmU5120hWOs3tXpDbG3Bq7YSVCUNA20=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=unlZS2RVcUhqQsePd4o6gLyfxum9OTkvBFR/qSUVwEQXPzmuUyUCt6YJruq2MgsJD/UtqfnUqYFR7Pah3zDh8Jyle5jrffm+6EbHTXXLbv07w6rSMDXXplT8schv1V+qn+QAiaDJHPXAF9AWmN/+3iKSUqjlMNfc9GpGk36jXd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=UuP+/gg1; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1736709025; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kQZrsUR/m/tv06rWZsxYN1BYyrovB4lSYjgECE2rR/9LvPKtbuiEPD5BISgHId/1ZLfmckt2nu/ILT1kBoNLDtpFXb+MzIBXCp8/rduEeDroMJ2Oiz2yRzME93ce7CPZGIhn0L+G9X4KXtZLbYM75rOoPBYoep+b0zZO7HmoTiY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736709025; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=6hujTHHtjiLUWmU5120hWOs3tXpDbG3Bq7YSVCUNA20=; 
	b=Um8zVyUOV+46B+Hrwa7wW1FiTSs7pNLrp+V9ADPG03jCGVgvwaSQProDfKSSnWQH8FZBqIQyWCgpdRdvDy36d0CCPL+xup1i99SoXKCgk1uv3FwGMHRbSbiwBEuuk/jh/P8gKpXNdy0PeJSbrYib0iL+KbeLwR1uZo7+fWnVNhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736709025;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=6hujTHHtjiLUWmU5120hWOs3tXpDbG3Bq7YSVCUNA20=;
	b=UuP+/gg12wWtMXjAsL9MPhzqZFTabEXk+u3/bx7lSTQKouDCso/91MLhleKcDAHP
	HnHGHApfqgumv/bw3MSXNXgBqDKzIdzDZxFznF2ZehWF5WlT+GoyH1pu1WgC2nqEjMK
	CohAn3JzKQWURM+8P4MmwN27ZYw6C4D/oYxUhGtI=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1736709020254956.2909690943278; Sun, 12 Jan 2025 11:10:20 -0800 (PST)
Received: from  [212.73.77.104] by mail.zoho.com
	with HTTP;Sun, 12 Jan 2025 11:10:20 -0800 (PST)
Date: Sun, 12 Jan 2025 23:10:20 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "linux-i2c" <linux-i2c@vger.kernel.org>,
	"linux-input" <linux-input@vger.kernel.org>,
	"Kenny Levinsen" <kl@kl.wtf>,
	"Benjamin Tissoires" <bentiss@kernel.org>
Message-ID: <1945bec9a47.7ee2a33b5058.7025603412967539178@zohomail.com>
In-Reply-To: 
Subject: Bug: i2c_designware: touchpad doesn't work after 40 min suspend on
 Dell Precision 7780
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr08011227c1e95c50715e982f1e2588e80000cd277134e0315ec8d07ea72c0c525448766bac8aac65b44c02:zu080112277b181fd4d8812d82b9c681be0000d13a2ad7210943fbd35dc57e21ca2ee27ae87c6ba015200ccf:rf0801122c476b2cec7a03fe785a1b79100000e23b06cffa51827163f735dcbf1ab236104119b4bd4c8026d97249aacde2:ZohoMail

Hi. My touchpad sometimes stops to work after resume from suspend. I reported proper bug report here: https://bugzilla.kernel.org/show_bug.cgi?id=219680 .
I'm writing here to make sure my report is seen.


--
Askar Safin
https://types.pl/@safinaskar


