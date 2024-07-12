Return-Path: <linux-i2c+bounces-4968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351D92FEA5
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 18:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65BF21C2289D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 16:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011AB176231;
	Fri, 12 Jul 2024 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz+V2njb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62F16F849;
	Fri, 12 Jul 2024 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802124; cv=none; b=hXhn5j0RlBBpgFyUwn5REUv4coLgntc3UTa9tCrLt/F0FRArqo8S8B2+1jVIKVTwy2mKbFm1elDq78533QEtFz6GcRcvX8MVboqaWZQm6rWkggRwH8IcObSkDEmF9T/jP6RfXy9g0yrnxaaZWwmFmQQZba4QaMjSbXQFpw/IDVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802124; c=relaxed/simple;
	bh=r2m/zU+vwI9w4oJRcW5wvMb2cFHwm54WEtcqoN5XWK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vrj0TBY68jB4g4vtkaSaPIQ/jzJ90PJQOMDkQ8LHfr1PCemFfLroSw7lZEsQJ34HWaZHS0FcXXRZrwytLHyGKolHu2DzYd1kW/4+6+QR1ERS4JwTXZVLZepT78P0oIaoBD88VBYzPcjo/yQP07A+FttXcpWAkX+5Wg2ReF0KoQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz+V2njb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9F0C32782;
	Fri, 12 Jul 2024 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720802124;
	bh=r2m/zU+vwI9w4oJRcW5wvMb2cFHwm54WEtcqoN5XWK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nz+V2njbSdeEapzGDB0dBNAWJQO6zMWY1Mvm2a5zVKqCzU7KqPOL1I/0tsn+KpQ09
	 FmUPpD16cESAkoKGzqXCp0GFy5CkDb6HNjA7YVIG4a38qTwptMTXgqtwdgZ/lSM4ly
	 8SARbXhjX5pH6wMzMW9iN+WvWqeJdKkay1aGoGadoMTqnWBPyTPvFRBPV9NKUUH6Jz
	 kzdgOH8i4hi+Fbh+ByRU4+i6CTUFiOvRll9uD4DMSJsnsK/TaqXWTLxgyQqqqLEYiu
	 r6gKpV0IiHhGHXeXtV0P4zWCu/2pRMqZFEm2g/Bz0K1bFRFB92n6HIe/s91lQgRKul
	 tQ4i/L7728mFQ==
From: Benjamin Tissoires <bentiss@kernel.org>
To: gupt21@gmail.com, jikos@kernel.org, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240709012223.17393-1-nichen@iscas.ac.cn>
References: <20240709012223.17393-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH v2] HID: mcp2221: Remove unnecessary semicolon
Message-Id: <172080212265.1416360.5200433925238530579.b4-ty@kernel.org>
Date: Fri, 12 Jul 2024 18:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Tue, 09 Jul 2024 09:22:23 +0800, Chen Ni wrote:
> Remove unnecessary semicolon at the end of the switch statement.
> This is detected by coccinelle.
> 
> 

Applied to hid/hid.git (for-6.11/trivial), thanks!

[1/1] HID: mcp2221: Remove unnecessary semicolon
      https://git.kernel.org/hid/hid/c/ad1ff1f250c9

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


