Return-Path: <linux-i2c+bounces-3065-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDB8AE28A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FF11C21C2B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 10:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347786311D;
	Tue, 23 Apr 2024 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwTBGA+W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E305F84F;
	Tue, 23 Apr 2024 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713869113; cv=none; b=eD6/+5T2lfdOJoY8gJMs+tYwFayXfxadf59GNbYi2k8ar8iN0Bq74f+EOSOxoJyN0dlhNX/+WEY5uHWP4cUoR1hk2CPG4YfambkySN4BkNRVTDqZxkJWkKlgGpijFrqCbZ1QvtGIpdRfpgPQwaXWrNhb4CXqx5Jkp/AfALjgz2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713869113; c=relaxed/simple;
	bh=JDZSOpWrNyj3WP4FutrVMP38BVV+9S9FWTePVklDb6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8LkckjIvNraSzSbuveR2dH6uk79UlBgF4ur0veM01wtyt/1SAqriPZM6/7LBFcHJqCdy5459N2WaQbFnPdZ+iWSWKVYPjZY9Gt5sAtjj7BbyPhJu40FNvS64FBhJar1T5KHa7/5pg7DFOd3WQZLOHlxz/e9HLHhuu7vCKFB1oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwTBGA+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD98C2BD11;
	Tue, 23 Apr 2024 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713869112;
	bh=JDZSOpWrNyj3WP4FutrVMP38BVV+9S9FWTePVklDb6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwTBGA+W6rOLRK/zwx6SS2rlkTvKYFAbGkJyx5n1+Z9fOamFcYmMkTZBQJHjmkyOF
	 TrTlKWB/3So5aZO9nqi28pEdXBvjbtEHy8KsO4+3TYkVhkvhJNzvY62zbM/Ms64EZu
	 3V/xby7hYFUE0qo7tzRXCJeINW2V0pSG54PZ+NJs3GvE5ND3CldpmT9uItjevtMCn3
	 lordz8LE3qurNM7AIHXfSAZKBcYn6EKPegfrlbLSU+lRWl6Wfe+8+LHMMsWGsCQQPl
	 IAlPKNGvmWwGfXGOfjhlRwU8gVwyDZY3hBTNq8ZPkKXYa/PJij8aMl4Dntf0Jw7ghA
	 ytJLqQ+DMkjtQ==
Date: Tue, 23 Apr 2024 12:45:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eng Lee Teh <englee.teh@starfivetech.com>
Subject: Re: [PATCH] [RESEND] i2c: cadence: Add RISCV architecture support
Message-ID: <p4xm2tho36utf35wpy23dqbddqkkt5xn74xskg3x7x73woqdyn@3vinoaiprw2y>
References: <20240423024805.1915300-2-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423024805.1915300-2-jisheng.teoh@starfivetech.com>

Hi Ji Sheng,

On Tue, Apr 23, 2024 at 10:48:06AM +0800, Ji Sheng Teoh wrote:
> Add RISCV support to Cadence I2C Kconfig which is used in platform
> such as the StarFive JH8100.
> 
> Signed-off-by: Eng Lee Teh <englee.teh@starfivetech.com>
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>

This patch was not forgotten :-)
But thanks for resending it.

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: cadence: Add RISCV architecture support
      commit: bc7f02e5a9249dff43ef2f1e8ddf1b3f4e352547

