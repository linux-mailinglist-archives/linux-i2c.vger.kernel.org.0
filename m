Return-Path: <linux-i2c+bounces-12259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1802AB245ED
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 11:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5753A7B8DDF
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 09:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43942F49E9;
	Wed, 13 Aug 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQTo0Bnr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7482F49E3;
	Wed, 13 Aug 2025 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078209; cv=none; b=rKy91rgwaEbfxeCWpNLlpUHdSqInFMDsTi86PtBJyixmkeAriJsTKyorXICxrRIELElZXwO8s+W17W6id/jtzowcKJ/v1yCsBy0dSnuAOhekhECXY2nr4NT8LbtZlnlTeQnLAED+mCI1VBiKEBYijkkPgNZWPhgbnSeou0GC6j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078209; c=relaxed/simple;
	bh=2CYSXSBYq1yIR3wbdZ1I7bq0fSZwbBOw313F1cLYXNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nM+brnzmtQtaoM3zRbVyar6l+wGhf7SPdETd0hSCP+h7H/TLZ2PL8ZWH3aTGmUH3ARr7asxGb4Tm2UfUW4CXi//4EsW9pkwicUkZ/4vXTNptNbwD4MWEKdWJYJ2XZooouzSDzxHOeh7yd+SIAiYTrlfgx1fJW02N7hyMohFlrLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQTo0Bnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56C2C4CEEB;
	Wed, 13 Aug 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078209;
	bh=2CYSXSBYq1yIR3wbdZ1I7bq0fSZwbBOw313F1cLYXNM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MQTo0Bnr5EORwCpjiwRbuiUfh0V5l3wgFfnbMKnLmOPvqSpVy/H/emqBbBPUUNx6F
	 nIta4TV6bWB+wiyCR7Il9Ti22jPb7MUWlWB8s3ZzuuaHuPRi4CK+uu383GDo+UrF3O
	 92L0TYp+tYJ8Xz+vrPEwGG9/L8CVmqonFI/+E4ocV7q+li9PelXzf3hIpA9GVCDEfs
	 zFLOQvZoCtfzgB8jy7YHBNqJb6ZeoQ7usWOP8uPqvqXC5vDwzG/F4X5KY0sWwE0pJx
	 ar0rLJo48bOPuKNODWrFri7YatVDaHNqXisxqmZvDkj+ZC2rPaAgsy0Dmfxtgbtua7
	 9hYoU0ZJchvvw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rishi Gupta <gupt21@gmail.com>, Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
In-Reply-To: <20250726220931.7126-1-contact@arnaud-lcm.com>
References: <20250726220931.7126-1-contact@arnaud-lcm.com>
Subject: Re: [PATCH] hid: fix I2C read buffer overflow in raw_event() for
 mcp2221
Message-Id: <175507820752.20076.8458113244883958100.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 11:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sat, 26 Jul 2025 23:09:31 +0100, Arnaud Lecomte wrote:
> As reported by syzbot, mcp2221_raw_event lacked
> validation of incoming I2C read data sizes, risking buffer
> overflows in mcp->rxbuf during multi-part transfers.
> As highlighted in the DS20005565B spec, p44, we have:
> "The number of read-back data bytes to follow in this packet:
> from 0 to a maximum of 60 bytes of read-back bytes."
> This patch enforces we don't exceed this limit.
> 
> [...]

Applied to hid/hid.git (for-6.17/upstream-fixes), thanks!

[1/1] hid: fix I2C read buffer overflow in raw_event() for mcp2221
      https://git.kernel.org/hid/hid/c/b56cc41a3ae7

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


