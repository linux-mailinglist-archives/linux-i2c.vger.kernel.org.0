Return-Path: <linux-i2c+bounces-2289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED3876453
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 890132819DE
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF1A256D;
	Fri,  8 Mar 2024 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyAzx52t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0094617EF
	for <linux-i2c@vger.kernel.org>; Fri,  8 Mar 2024 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709901022; cv=none; b=XBgsVmPfKdZn3ZN+4i/zJNl6rSdkX3YGPh6TJ0e50EUFFRd6xI+nTsbOfxCVe9l83vY/CJ9tdLUxZvYOSbuj+AgidHsK4bVLr7nvSdglaPRMJ6JMRSz2tc4dpndtU01uPmPvOhVbboyKNerWFfJOD3BIkhmAIb5/LCUE+XgCfC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709901022; c=relaxed/simple;
	bh=TB1KM/VBJF5ZZIXhh0wL9ptTBu7GAjaS16kBDnp4DZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeTntyJQIrKwRUc3QhtHMV8gNrKhyU1PIKZ9vBCQIY+xbjYDiITm0xz5Uc7wa7pQhvxOBii6snEvSg9Yq9SeE2U+Y4hmDCBP4Ohvn9Bbovp72tk0ryIpe/511QXCMs2IJ0aqN19rQYoX3w6iYGy21XzWOuX7QxIG5Yj6fimwZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyAzx52t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36B3C433F1;
	Fri,  8 Mar 2024 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709901021;
	bh=TB1KM/VBJF5ZZIXhh0wL9ptTBu7GAjaS16kBDnp4DZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyAzx52tkoY74fuMJUU8N5RTtjhuCvrwkqUZfK92B7vQZVSh7luSnhXs07wWKcI8N
	 RKkWV6AeiX7udLPYQNsdX7W0bqRCAOcQ/JPnGsS+0yqRfpVvhvBXPnva4NGh7veeaX
	 +f2vgZK4f2ZSOKhT2Rl4YbDDuco+OYh0sayWbaZYF/n/niuhlX7e9W6cJIoWbIgvq0
	 yvsdbr3+tRz6ZCe0APmXbJ5p9qXyPeKHEasPN0N56m/9KupekcYeD0za/K5FMGS1Jp
	 CxLAkwuG2dohptmy2CYlIzReUjDtZ5uhspWjESiQK27PhSb3Yyk2iRFPrj4SRpu61G
	 AlHGSFZ4HaknA==
Date: Fri, 8 Mar 2024 13:30:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: linux-i2c@vger.kernel.org, wsa@kernel.org, cobechen@zhaoxin.com, 
	hanshu@zhaoxin.com
Subject: Re: [PATCH v9 0/6] i2c: add zhaoxin i2c controller driver
Message-ID: <4ye4j5u4cz5ov5jhy6slnzrq3upzly7wltst7xqr4mhwmapyda@bpwngiy2l3me>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <20240306212413.1850236-1-andi.shyti@kernel.org>
 <8b2a2e56-439a-414d-a592-6f58015c4fb8@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b2a2e56-439a-414d-a592-6f58015c4fb8@zhaoxin.com>

Hi Hans,

> > Check the changelog for more details. The little adaptation are
> > limited to patch 1, 2 and 3. The other patches don't have any
> > change.
> > 
> > The series has been applied in i2c/i2c-host-next[*].
> 
> V9 does not appear to have been applied in i2c/i2c-host-next[*]. So, should
> I submit a v10 version? which its structure is: * patch 0-6 is consistent
> with v9. * patch 7 is new to fix issues as you mentioned before Thanks, Hans

I'm sorry, I forgot to push :-(

Please, check now.

Andi

