Return-Path: <linux-i2c+bounces-9793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC83A5D2EF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 00:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAF2B17AA25
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD171FE44A;
	Tue, 11 Mar 2025 23:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StBPAcEa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910231EB182;
	Tue, 11 Mar 2025 23:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741734410; cv=none; b=W8NlDJOAxH0hyr+2ImkwIP3Gn746h0dbsPYPnGCYBtEAqH6WL/1Pr/nYBYgqzx6taEyNw/uF3gqlgvHKY6bKFV4Q4n4EYavVhmWAdXHBPpI//wuXB5azMcYl/F6ENFSYKRSNuHSX73NsePpwFuyeQairPZqkbrgcjOuc1hyjJ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741734410; c=relaxed/simple;
	bh=z2jr4kUGHp/i4t2CDbop0oW0icTJSM6eKJBi7WCLEZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9QYHFoi3JaNTHyRxah7Qb4lPWevMDOKItTlCnpMBaLe5HlgtRBOawU4R66iY0G7502O4EbAy7T9vjKWaOptpgwJ6j8lqqFxYEriKuxpBy9yX84I0bjs1SUY04mSpODj1hbCLZjwAicCzB4+Qch99SQYZevy70R0l2BAHt8NtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StBPAcEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E1FC4CEE9;
	Tue, 11 Mar 2025 23:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741734410;
	bh=z2jr4kUGHp/i4t2CDbop0oW0icTJSM6eKJBi7WCLEZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StBPAcEaQmWeVb0Q6S3o1pX7MhbUshl50qMH8JnSOXbRxANoMv29l8rY+sZVnmhOh
	 l/C0L2UyDSyAN2pSuueSNS9PpoCmAPT/uB58V1IgT4Jfmd2aZhDCv4ujphrC7hkFPt
	 2/e8BzFsmtIn68owBWn4RMNPBCSFJWm8GmPj00Yj2BAA5GDqwyiZVwVH+aPe69605c
	 2vhhblSo0DKn0dYQSyOAos+thm324mcIYC2U7GZwi/T6gEFu6yhG3ksbQDGIn1E1FQ
	 IIB4B7o6oCFhWwDjJmodYcHKiDz4VBOdf2NRkBu+zo/lbRiUU6w/jOM1QsryecmmiK
	 tO4fLJ+micCRA==
Date: Wed, 12 Mar 2025 00:06:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ali1535: Fix an error handling path in
 ali1535_probe()
Message-ID: <lzvf42gr6thyweoub5xhkhoaaom76bzefbvjvifsctnhfofwzr@e73yatf26vet>
References: <0daf63d7a2ce74c02e2664ba805bbfadab7d25e5.1741031571.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0daf63d7a2ce74c02e2664ba805bbfadab7d25e5.1741031571.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Mon, Mar 03, 2025 at 08:53:08PM +0100, Christophe JAILLET wrote:
> If i2c_add_adapter() fails, the request_region() call in ali1535_setup()
> must be undone by a corresponding release_region() call, as done in the
> remove function.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

