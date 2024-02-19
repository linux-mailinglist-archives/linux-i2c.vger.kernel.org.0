Return-Path: <linux-i2c+bounces-1854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D33A2859B4E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 05:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 151EB1C20358
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 04:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D27BBA42;
	Mon, 19 Feb 2024 04:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="dnOklByV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A955F4417;
	Mon, 19 Feb 2024 04:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708316100; cv=pass; b=FdVk0ZiLJ9WKSOtYfS5VzVeFDZApiVFiYksyMIKALkieLu+18L8uJYUCZOmy3ujYZi6xxjzxZ9rTblvogHgHbUJW1CYI5kWU43wh+tBRFfLSM0FInp2/KcdEuvtiH82d1OZq0jcaPl6yY80t8O0A58xu8lxW0e2tc/gqDLWjw24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708316100; c=relaxed/simple;
	bh=Z1gAb16W9I8PAd503OhSrom3uYR4o1FfjAYY2775p1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSf9e8PS+PcJCpQJUK9MlQvv/2/ogRRyNWqV/QtP1aymAZupIGrbM9Geet0Mto9iV02XYNlmGQZS4oO4vT1JeP+Z+hJP2H4FuxdF30TFImlLK8JlBPkAAV49z4g3lqlH+E7SP9xoYutUOj5/gcIhX3tE5VCBeqpXTVXKHhXuw4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=dnOklByV; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1708316093; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xq+ZxHc8S2t1Iw7sZUHLl3hrxN0i84hAFx7P89PHrAxdwx9Id3tCX+9nUuxGJb/bRnB90Ovm2O3Hqx7iB/c9mZXJmKuwVonBG8P1i39doC87LRPi0/X4jsgJaiu4ZcgHpcMG+KWWfBZl4Umh5zDNZilOxGZNLkI3+ECigVtWSy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1708316093; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NqPaRh8aOdG4JlDmQudoUBGyUgoKA1SPF8j/TwjjkD0=; 
	b=NTsKY6qGlrDc/r32vFrNRlpQAL1+XOawa6qW/p823MKcI2/ixw772+/yQYQkAyaC8/wU3HVeGzrcoHhvnGqUzEjPFp3uBA8sDLB2YYROytI0//VG5Go8g6VfIpFQeep0/8dfCp0CPqSibeVfv6cSYhFbg5/RkKl9TzwoS/D/dXs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1708316093;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=NqPaRh8aOdG4JlDmQudoUBGyUgoKA1SPF8j/TwjjkD0=;
	b=dnOklByVZJUzKrhBIM3uEg5g1B3ZYu6TAnc/O1H1AAEIYRzey1jYGNZQYO2uU7pc
	UXahOrHUF7uhv1qSORfuGGXyN1VLPL6UxjFJbQh4Se+tPp9skBQnJiFjyGVNFFEQQAx
	KP5FzXLtugCxHwQKRoi4EazsyLofZNKc+LLgV0T0=
Received: from localhost.localdomain (212.73.77.98 [212.73.77.98]) by mx.zohomail.com
	with SMTPS id 1708316090324802.4630218081528; Sun, 18 Feb 2024 20:14:50 -0800 (PST)
From: Askar Safin <safinaskar@zohomail.com>
To: bbara93@gmail.com,
	linux-i2c@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix atomic xfer check for non-preempt config
Date: Mon, 19 Feb 2024 07:14:44 +0300
Message-ID: <20240219041444.4122-1-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
References: <20240104-i2c-atomic-v1-1-a3a186f21c36@skidata.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112276daf8834c3f111c7c3b041820000e229be3ef913ee899be9794c1cc24b9d86d518d08e9b01fc15:zu080112274d52255b9387c9753c7da0800000d89620d75a0a4592a3b0f02a9f638f501ca91339394f59be7a:rf0801122cb93009be99b99b2a8a70c126000076b03e12f3a80612ae9ba9216b5f82ad90b9b6bba00939b0b02063c1b07f:ZohoMail
X-ZohoMailClient: External

Thanks a lot for this patch! It fixed big backtrace I saw at very last stage of reboot. That
backtrace occupied whole FullHD screen. Now it is gone. Thanks! My computer is laptop Dell Inspiron.

I hope this patch will soon arrive to debian buster lts

Askar Safin

> Since commit aa49c90894d0 ("i2c: core: Run atomic i2c xfer when
> !preemptible"), the whole reboot/power off sequence on non-preempt kernels
> is using atomic i2c xfer, as !preemptible() always results to 1.

> During device_shutdown(), the i2c might be used a lot and not all busses
> have implemented an atomic xfer handler. This results in a lot of
> avoidable noise, like:

> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
> [   12.692313] WARNING: CPU: 6 PID: 275 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x100/0x118
> ...

> Fix this by allowing non-atomic xfer when the interrupts are enabled, as
> it was before.

> Fixes: aa49c90894d0 ("i2c: core: Run atomic i2c xfer when !preemptible")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>

