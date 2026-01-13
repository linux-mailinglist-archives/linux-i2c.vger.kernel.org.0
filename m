Return-Path: <linux-i2c+bounces-15114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D1DD19E65
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51BD9301B100
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463152F2914;
	Tue, 13 Jan 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b//yKE6q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327E22D0C97
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318276; cv=none; b=sI+vXHfpzuA662NDnNxZO34iwU3vkYYpgGhrpPNFcUTBiZMhvd8z91P6nd76mmPVRCuU3Ay599tHc7VNHStP7Vn2NfQfoyHsk3I/6bO9EeDvb7v/aSG2q/w7x9ow+ewa4Y0z78JRADkYHRz+l65fasfXeLNbLhQjdcMM/+IhMsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318276; c=relaxed/simple;
	bh=FcGay/4lt79PMY2WhaeLVJo/w2x4GzZMPvFzaqw/i3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlPQD4+OwK86ejzMsAlubisPuaxTcMuveFouHZ8PNbtak3V31jVI1avmxCV4PtyW9/4Vkcq9/ygISZCal0BYT+xKD73iYW5GFQomwZLxR7h61OoLKQGZhOhLawP3409/2LWiNnCD96am3fGsiJ1MBolu3eHytttpwv7m3tT8d6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b//yKE6q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bfub
	b3D0fkSpRc+J48p6HTqpyJx0mKk+BvFrJYYZyI4=; b=b//yKE6qQWqEuFAW9FmO
	4WzBvqUVopy7AyiOvh+pIdFSTjzXChIh4O5PD9bLXRQU1Te+HadUraX6lfcGzowE
	uLHQQdyVGAuqGY4185GemRYsBt0ohf4TW2MYPFqPKfZ0SHgEtLdiwBX6CGsw2BZc
	7tpEzA2pa+3gxs/ByuxIAJ5xTp9tzZpF7VrCHZzeCBPBPjvSJMlUWYnqflnz84IY
	GxV5MX3H+xKYHy2NOqWyR+8oyaM9ppMN8tlQlNFXQJ7MgrwHcl5D8dwKdh1j1thb
	8w6CpKO6TSHA9cjDopdIqBUE2Geqk0Vclj168kPDKfST5fju5QBWvx+lX0lNs3UX
	pw==
Received: (qmail 1752685 invoked from network); 13 Jan 2026 16:31:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:31:13 +0100
X-UD-Smtp-Session: l3s3148p1@VHtDrkZIiOgujnvx
Date: Tue, 13 Jan 2026 16:31:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries
 for brcm,iproc-nic-i2c
Message-ID: <aWZlOydXFVQMVL6d@ninjato>
References: <20251215212805.3322218-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215212805.3322218-1-robh@kernel.org>

On Mon, Dec 15, 2025 at 03:28:05PM -0600, Rob Herring (Arm) wrote:
> The brcm,iproc-nic-i2c variant has 2 reg entries.
> 
> The second one is related to the brcm,ape-hsls-addr-mask property, but it's
> not clear what a proper description would be.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to for-current, thanks!


