Return-Path: <linux-i2c+bounces-1545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC91D843248
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 01:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658731F25700
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 00:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14735672;
	Wed, 31 Jan 2024 00:54:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 8.mo550.mail-out.ovh.net (8.mo550.mail-out.ovh.net [178.33.110.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051525663
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 00:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.110.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706662462; cv=none; b=LgcWxq1YeCXVBqOy52bcPLkGlDLHxYfGb/Tw7nN9J32hC8oOVhFVY89hiWME7zu4B0o+2JPq4IgbewuuOWLW2qO+7Qbrn1MfV1xfC0lTQlAkwS+c4LQmhtFr/csguuAvmpMHJas1Utuo+HKNGXL/vQzU6HdpOwUNPejh/FyqBQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706662462; c=relaxed/simple;
	bh=8KsgsllYFPEA/uA6j24PilHxu1Pp8tHxVqsy77MMDbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j32xDfNbnKTZfH/+RmUXFF2s32TQAGbmLzlS9lkBg5r0WXRUBhogN5VR7Q5HascFBAXxdLMWxplRez6ZCS0Knopv+Mr3UOB8oojq9IQVG3DPHnENYALejL6x6n0vt2YLz9GE2BhWXMjcx8s+l62hA4+XqDDV2HMJOvkVZYMBAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.110.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.148.38])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 7A73727589
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 22:24:57 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-5frdk (unknown [10.110.96.170])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 85C121FD84;
	Tue, 30 Jan 2024 22:24:55 +0000 (UTC)
Received: from etezian.org ([37.59.142.105])
	by ghost-submission-6684bf9d7b-5frdk with ESMTPSA
	id XTdgCjd3uWVeiB4A47W47w
	(envelope-from <andi@etezian.org>); Tue, 30 Jan 2024 22:24:55 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-105G006d9bfaa25-691c-404b-a24a-28317cd3cd5a,
                    A55004731C2A18159FC94DBA16C28717FFA6C146) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.145.85
From: Andi Shyti <andi.shyti@kernel.org>
To: Jean Delvare <jdelvare@suse.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] i2c: i801: collection of further improvements / refactorings
Date: Tue, 30 Jan 2024 23:24:42 +0100
Message-ID: <170665343930.3585967.14803302652877929845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8590897764897589904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtjedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeevveeiffeifefgfeduvdetleffuefhleffjeetjeduvdevkeevhedvjeegfeetveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdduleegrddvfedtrddugeehrdekhedpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

Hi Heiner,

On Fri, 22 Sep 2023 21:32:57 +0200, Heiner Kallweit wrote:
> This series contains further improvements and refactorings.
> 
> Heiner Kallweit (8):
>   i2c: i801: Replace magic value with constant in
>     dmi_check_onboard_devices
>   i2c: i801: Remove unused argument from tco functions
>   i2c: i801: Use i2c core default adapter timeout
>   i2c: i801: Define FEATURES_ICH5 as an extension of FEATURES_ICH4
>   i2c: i801: Add helper i801_check_and_clear_pec_error
>   i2c: i801: Split i801_block_transaction
>   i2c: i801: Add SMBUS_LEN_SENTINEL
>   i2c: i801: Add helper i801_get_block_len
> 
> [...]

Applied the first to patches to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/8] i2c: i801: Replace magic value with constant in dmi_check_onboard_devices
      commit: 9f14f46a276521c92cdffb0fc36f907e868d3888
[2/8] i2c: i801: Remove unused argument from tco functions
      commit: 96b125361866d998471c1380f809f2a2b4db60c0

