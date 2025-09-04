Return-Path: <linux-i2c+bounces-12617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A32B43860
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 12:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A0697B200A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 10:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E1B2FD7CD;
	Thu,  4 Sep 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KP1XDdPD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B62FB997;
	Thu,  4 Sep 2025 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980839; cv=none; b=jGObjW+1aWPwzuCtbYXe7TqREGyFCzVtxTbr3pjv1deAXHNUyuZsyboNO9QLyJjj/E6+TqIBumCt+yQkX38fjf0wcr1+GO40v3Faqbd7lUmafik6iobyzVdbqN+dYXAp6uRx7TAH9RbarRi05a8xw8nogUHlcPCFmeBbIw5UnT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980839; c=relaxed/simple;
	bh=NUXBGorpfX1dFW3t32U5gwH5Wy9j/UQQwqBTfYrbJ/k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=sU1MtG8PRrPZahqMNWKfYqmDZP/sjkNYbufYlURTJSRUIsyMkvM/FIlXgKY7/xtq7hzapkFuGDi9xtbveq/o4olNrr905QCgBU+hSsFIjTUY4WBFhc9f20VvMGG6Z6NwMuf5+ty4gw/+6r24hj9u09fzAoQyw2ww/TqqDeQPZng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KP1XDdPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81EDC4CEF0;
	Thu,  4 Sep 2025 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756980838;
	bh=NUXBGorpfX1dFW3t32U5gwH5Wy9j/UQQwqBTfYrbJ/k=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=KP1XDdPD+ltUTgj67UNZVOt1/8P/hC5s6SQ/wzOGaKfxZ43eNK2TroiHtuXDCo6xq
	 IJCXa4yNAWeZR/gszOKYhWPCxHJ7dWYXuw1eo2oYN2yf5yzyvHz5ncLeFimZC3xIN3
	 9r2/vZ+IoKnODDZEWhGBGRihEYc58V6MpZN6hGkJBHftxwlWtl6kfw8OQEJ97HGqnK
	 stQQfdxMOXDfeQweemhZFEGMR7b347MmM82hfGvDzQZSSrYwbC1/jNrM1FDEg3rsU/
	 sC/bWFCgjvQc26omuVuoV7jFuEvkcCJSdHJupxp6Q0okYjGvvwPwgM6CU/9+BBgBBC
	 5OSWFMmweFm+A==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 12:13:53 +0200
Message-Id: <DCJXQ4CUQ88U.ZEEGKWZRCGL6@kernel.org>
Cc: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 =?utf-8?q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>, "Daniel
 Scally" <djrscally@gmail.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <aLgY1z-MvQbDBx2_@smile.fi.intel.com> <aLlgpUlHp7t8P4dQ@shikoro>
 <aLljGIcjAjQhC2uS@smile.fi.intel.com>
In-Reply-To: <aLljGIcjAjQhC2uS@smile.fi.intel.com>

On Thu Sep 4, 2025 at 11:59 AM CEST, Andy Shevchenko wrote:
> On Thu, Sep 04, 2025 at 11:49:25AM +0200, Wolfram Sang wrote:
>>=20
>> > It might be good to have an immutable branch for me from i2c core.
>> > Wolfram, can you provide a such if no objections?
>>=20
>> Sure thing, I can do that. But there is still discussion on patch 1, so
>> I will wait for an outcome there.
>
> But it seems that the discussion can be implemented in a followup?

If Sakari attempts the rework, and we can prove this doesn't regress existi=
ng
users, removing fwnode_for_each_available_child_node_scoped() in the contex=
t
of the rework again should be trivial.

Given that, I don't see a reason to stall people working with the existing
semantics of the API in the meantime.

So, AFAIC, my ACK is still valid.

