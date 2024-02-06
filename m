Return-Path: <linux-i2c+bounces-1634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A4984B052
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 09:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23863B2187E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 08:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040C812881A;
	Tue,  6 Feb 2024 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vexlyvector.com header.i=@vexlyvector.com header.b="Rvre1ZSp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.vexlyvector.com (mail.vexlyvector.com [141.95.160.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D9312BE8E
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.160.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209480; cv=none; b=S7ph4hy/vEGYqdLJPoz1WrYgazQAwRl5GQXG3rjfcfx+QAi/tGgOnFzYrGOxMggdk7ljK8bolDLcZw6QCC7vK6ygQSOKPl5x+c8yX63Z4ZhixzufPSqWWzhpH58ezJrJJ99Ec3U1PFUiQ4AiGwttsE30zWulHOfvDo18oIyEaiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209480; c=relaxed/simple;
	bh=waaYxUsyRtmB2zEBuWcqRuRHSoYd8sJFCtgHO/3AHKE=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=Yka4qZy+C7FYqwV9nBOsPN7IpvzJVOjSel7pjG3wEpildmjhJb+vqmVhZlIvFUEYid4OJCyx2+lXksXabTBG7szBuJuifcilN5zsjfyib67qbpEfCcSHmh8ynMJP5Qvp3H+P+NH/PX3MLkNPaq0sAQP4tCAr3If1ZKVr34buKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vexlyvector.com; spf=pass smtp.mailfrom=vexlyvector.com; dkim=pass (2048-bit key) header.d=vexlyvector.com header.i=@vexlyvector.com header.b=Rvre1ZSp; arc=none smtp.client-ip=141.95.160.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vexlyvector.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vexlyvector.com
Received: by mail.vexlyvector.com (Postfix, from userid 1002)
	id 85D8CA2AAD; Tue,  6 Feb 2024 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexlyvector.com;
	s=mail; t=1707209470;
	bh=waaYxUsyRtmB2zEBuWcqRuRHSoYd8sJFCtgHO/3AHKE=;
	h=Date:From:To:Subject:From;
	b=Rvre1ZSp3MvAK1IJMM7/Kcli91gh1gyPr9D5LgzaFMfBwVJwtRVueeoVNo8KnJlgS
	 V4NECc9qMpY7/Dc5me1896qurkQIH0XG37i0Sjsfwkyjd3OXxVUDYNA62ZKZx9fO09
	 4MrIS1Den+3aEsdfZN/h/DiA36O6vjQMHJ0m1539jjDPsJlyCCGoyx/yMkVsdTh9bq
	 CsDCMBSPGSGWOlquh2NOhUkkr9Xc8as5SFrk1FEnnVEByJmtS2/utlQYD/nuLnagg8
	 q4X6q5HFBq58/9p1i9bSbJJ3q7Bl3JyLOWoqNaqXu34q8a2HFgJoZNfHpFnqLwDbUg
	 btPUfdjVpA6jA==
Received: by mail.vexlyvector.com for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 08:51:10 GMT
Message-ID: <20240206074500-0.1.bu.ploh.0.eghov4ss7o@vexlyvector.com>
Date: Tue,  6 Feb 2024 08:51:10 GMT
From: "Ray Galt" <ray.galt@vexlyvector.com>
To: <linux-i2c@vger.kernel.org>
Subject: Meeting with the Development Team
X-Mailer: mail.vexlyvector.com
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to reach out to the decision-maker in the IT environment wit=
hin your company.

We are a well-established digital agency in the European market. Our solu=
tions eliminate the need to build and maintain in-house IT and programmin=
g departments, hire interface designers, or employ user experience specia=
lists.

We take responsibility for IT functions while simultaneously reducing the=
 costs of maintenance. We provide support that ensures access to high-qua=
lity specialists and continuous maintenance of efficient hardware and sof=
tware infrastructure.

Companies that thrive are those that leverage market opportunities faster=
 than their competitors. Guided by this principle, we support gaining a c=
ompetitive advantage by providing comprehensive IT support.

May I present what we can do for you?


Best regards
Ray Galt

