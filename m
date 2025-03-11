Return-Path: <linux-i2c+bounces-9781-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A105AA5CF14
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 20:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407853B1673
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 19:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E012A263F45;
	Tue, 11 Mar 2025 19:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="YrJKGCic"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30152620DD;
	Tue, 11 Mar 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720499; cv=none; b=E10UiCxORadDpmRL8pHjKaaIR8+UR+mlPvN2M/R/g/v2K6AakE2QsIYf5fH7d7ZsM4J3fXd3cho86h3PEzxPvQX6At6QVgz13/ePJuMLF//IhN8cMyju8DZ4DCBbI1WTJD8o+4NXcUYzA8KtKcHtyks985YqskdaCUGAtIuqb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720499; c=relaxed/simple;
	bh=+4FBym89tJ0UDJqFPTZuM50h9ll/UMyW63UxK5b942k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3be03tBpWi8oMxEB7QPsrS9VlcEB2bmLsbAwdcifN+bAmRvyuYNyFgcMfbqIOz3ql3Of2cwKp/OnkBybLtBdiKVYz5OXjDAQuxK+W2NwShabKBEk96kiLcLky//Fw4240ijDqVfI7Fnq9BIuM6C0ft3E9t2LwIQfvDIt+p8qLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=YrJKGCic; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CBduAOkDSwxepXVq1C+G3BYIavodzVnFqo9RdkSAQlE=; b=YrJKGCicDK2subZPy1Kw3aiJMR
	+b1PqcgLYekFehJvISmFny7yA1Rhuc9o6u6dUZpW2aNvY+RtCgFzWKKpun4e+7k/41ScUbYHtVFsU
	4i5Pte6iRWMl4EYgYLa5uER1e/WRoUzVEyay5JqOaTfxggHzIcORNXh4aQBZc+q4R6zEa1aqt77XM
	w4yy6N5pKPlr5JRdzwGVsXde1u6wosZGo3+RKeyiscOAMv3W5TE4jZ9hPO2QgNAcbIWQ6ERQFSeg2
	LgalTWSfR+k930iQeLs/mjH2GXYO+QcZFx49/Gi0mhYAZ2wEB0ionmlcT6ri6mv50QfQ2Q8dKuTMj
	m7IkY5sQ==;
Date: Tue, 11 Mar 2025 20:14:50 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: vigneshr@ti.com, aaro.koskinen@iki.fi, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com,
 andi.shyti@kernel.org, reidt@ti.com, wsa@kernel.org,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] i2c: omap: fix IRQ storms
Message-ID: <20250311201450.61d48787@akair>
In-Reply-To: <Z9CA8H2GAArdTRqI@shikoro>
References: <20250228140420.379498-1-andreas@kemnade.info>
	<Z9CA8H2GAArdTRqI@shikoro>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 11 Mar 2025 19:29:04 +0100
schrieb Wolfram Sang <wsa+renesas@sang-engineering.com>:

> > This needs at least to be tested on systems where false acks were
> > detected.  
> 
> Which do you mean? You did test this on GTA04A5, or?
> 
Exactly the tests which Nishanth did. So I would say with his Tested-By,
this patch is good to go. I test on GTA04A5 but there and on any other
system I have I did not observe the false acks but there I have the IRQ
storm. And I want a solution which avoids the IRQ storm and also does
not reintroduce the false acks.

Regards,
Andreas

