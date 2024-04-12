Return-Path: <linux-i2c+bounces-2923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA28A32D2
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 17:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4CD1F22397
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 15:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659F6148822;
	Fri, 12 Apr 2024 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFy6NhtX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEB1482FE;
	Fri, 12 Apr 2024 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712936978; cv=none; b=K0HzrMApaOh7HWeavoE7L4LVmhh3qay6508h/wY1AKd+fsNmPutcvTZCCBgLpSHwmfdBXMXK5yJdb6GwDH0IRrUjDQ3QMNlctRQiDlZs57zHpT+++Rs8D5iJOTihbvQ0GgbH71VATENLBpaBHLWoXwN4KKUqzADWBV74WTf2ZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712936978; c=relaxed/simple;
	bh=6IPllhiWsRQFon3Jgai19EkRggWiOdDFecckZx9Xxi8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Rkhj7q6KHLCfqWTbyRlx86ND7q61MPzZPXnASkQWLuU/0UhGTjmnmARJS8JPyOPD1HDqKWaZpoiN8ZCGMG1bVS1XNqVh/z8l8y2+/lf4RRQV9LcHtRTxxqmtfQZMJKseGrzWv49lEaHCnMRJke8YwziRbtDdrPpg8xMyXDNJqgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFy6NhtX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9132EC113CC;
	Fri, 12 Apr 2024 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712936977;
	bh=6IPllhiWsRQFon3Jgai19EkRggWiOdDFecckZx9Xxi8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tFy6NhtX3aOrzY5wVcQ3rioRLHjks7KF8KTJiB5ttx4YKNxQjvOOvoH9JBP3so+gQ
	 707sKlaYwh/5e1Q/he812yQFTlHyEx5k9vyXa4TKDFIUcemWeLMKc1w6fechhfXNKX
	 LaFw45Inox7ti1CfxpS2L5XUa1C/Obz4bqGsWs1qb7cgQlQpHgp7NrPTTK9rW6PvyS
	 5g5aWEqzPVKfJ82G95yeS0dhF2UDRve2noNKnB1JsLwY1/vN8soVFsLQuegEcjV409
	 1U8ujS0eKvpuRxrwEtWc13IFxLrbkJCpjv/XU6OisL6mhDsKOtSe3CFUj3yVPD0K6J
	 NUp0gzlAi0SnA==
Date: Fri, 12 Apr 2024 17:49:35 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>
cc: linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
    linux-kernel@vger.kernel.org, gupt21@gmail.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: mcp-2221: cancel delayed_work only when CONFIG_IIO
 is enabled
In-Reply-To: <20240402121406.1703500-1-abdelrahmanhesham94@gmail.com>
Message-ID: <nycvar.YFH.7.76.2404121749020.5680@cbobk.fhfr.pm>
References: <20240402121406.1703500-1-abdelrahmanhesham94@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Apr 2024, Abdelrahman Morsy wrote:

> If the device is unplugged and CONFIG_IIO is not supported, this will
> result in a warning message at kernel/workqueue.
> 
> Only cancel delayed work in mcp2221_remove(), when CONFIG_IIO is enabled.

Makes sense, the work is scheduled also only with CONFIG_IIO enabled. 
Thanks, applied.

-- 
Jiri Kosina
SUSE Labs


