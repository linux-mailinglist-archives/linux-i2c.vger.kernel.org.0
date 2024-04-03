Return-Path: <linux-i2c+bounces-2758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2D897C0B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Apr 2024 01:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F953B2314F
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 23:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9E7156995;
	Wed,  3 Apr 2024 23:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcKTwoOQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC3156663
	for <linux-i2c@vger.kernel.org>; Wed,  3 Apr 2024 23:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186960; cv=none; b=QqKg85H11cI6Q3mZtSnI6eqFoTHuydcZO9A2tUhyk5iQ/V5tMbPXEI4qt1NbdrWvS8qRaOkjudrkGtVUPUVYfjnN7G1VSICYeg5UcuXiDXWezQZEY1nYLISZbHDZvEdi+H0yZs5I54VMWGsC+NkTQ671W0EEL+1sgOGJu5lRNCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186960; c=relaxed/simple;
	bh=jFJRbB2KyWb1+12ldvBewnLJbkr/ur6lwEsUwQa17GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1dFFn5/eh7t60mz8PqES6yILS2qSmg4pltn3fAPahvCaGdR8ePpE4+NzvDfcfe6D10vM/6YDQpprPb+wUQIO8IDo04ogEGmWKkA+iQpka2fOvYL6ELKFlCQpUPtF5Kv9/y/4YO8vxlvbbBV5DTIO71VHf3to6UhQCcVW8fyPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcKTwoOQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691A0C433C7;
	Wed,  3 Apr 2024 23:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712186960;
	bh=jFJRbB2KyWb1+12ldvBewnLJbkr/ur6lwEsUwQa17GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcKTwoOQDgO66SZDbM56qZyvuk4zPK1uVupROL3TRv9htyxWuVmsEkmoT2gmC8NS/
	 t8EWyQptVplVX99QXK2ZjduayZxjVvIf+rL47SqveXDgR5SaQFQvFf8AM/yXRN+8M1
	 HtSoBKABrM53+oJodrfmeFqpYvHk0gc/KL1XtuGMuOcVROhr9dyghLMqk926mdLV55
	 /p3cyKZBn3OnNgMVR8Z0tPtwg9kxImFQA/TKydljSM3djuiA2Ve3sg0P+XX2dXuCwc
	 +jWoSK3CLHluqJ3VbtdjPpVX0InmEOrSuV4RUjuqbSgDJXK9iCWeNUM3CCjf2fwz61
	 mlrLh09selgxg==
Date: Thu, 4 Apr 2024 01:29:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: linux-i2c@vger.kernel.org, wsa@kernel.org, cobechen@zhaoxin.com, 
	hanshu@zhaoxin.com
Subject: Re: [PATCH v9 0/6] i2c: add zhaoxin i2c controller driver
Message-ID: <i5jeghpblde4bzwuxidd2rxaqyvbb5npvl7ra4swc2tysonb2k@ms42yijtkakw>
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

On Fri, Mar 08, 2024 at 09:22:16AM +0800, Hans Hu wrote:
> > Check the changelog for more details. The little adaptation are
> > limited to patch 1, 2 and 3. The other patches don't have any
> > change.
> > 
> > The series has been applied in i2c/i2c-host-next[*].
> 
> V9 does not appear to have been applied in i2c/i2c-host-next[*]. So, should
> I submit a v10 version? which its structure is: * patch 0-6 is consistent
> with v9. * patch 7 is new to fix issues as you mentioned before Thanks, Hans

I just want to make sure that we have an understanding on this
series.

Now that the 6.9 merge window is well over, are you planning to
resend this series?

Thanks,
Andi

