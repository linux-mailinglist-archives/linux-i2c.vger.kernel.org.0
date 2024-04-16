Return-Path: <linux-i2c+bounces-2987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C831B8A7847
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 01:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2EA1F242CC
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 23:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141CE13A24D;
	Tue, 16 Apr 2024 23:03:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 3.mo560.mail-out.ovh.net (3.mo560.mail-out.ovh.net [46.105.58.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E15139D0B
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 23:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.58.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713308596; cv=none; b=Z7Nrz9MmRsx7G7UX6oi89fK3ep0F/bfF4KKDBpfsXFA9pbNgm5UrkI3HV1byi6eohxEJVORndYURJwZaasIJrKwgn4JMTeGfjdh4vWgqqnZ/rvjcPXW03OMfKeM3MfbvTB0JyrdRugMZuT16eumtcqgFk7uqkzuqfz8DuIOz1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713308596; c=relaxed/simple;
	bh=Uc7Mnb8B69ysAB7znChRPbnyoDIzKo/8+uktKLgFPkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TnCKrd4QhUS8B+PUQVrZVtz6F0bP5OG/YZZMJbfnKXkNRImZqJ26lQZ39y2TsaKIwPxby4lLkQkXKAW8s8FOil7UwLkOAy8sjisnRWwEFzDNgT4r5csbLBI52DrZ+LfcsVdtAr6W9CaqdstbIpeZRMoXwBdUFUIYg0VZJ6BgnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.58.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.211])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4VJzfc04GHz1VZ4
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 22:46:15 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-f5zmd (unknown [10.110.96.237])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E25531FE0C;
	Tue, 16 Apr 2024 22:46:14 +0000 (UTC)
Received: from etezian.org ([37.59.142.97])
	by ghost-submission-6684bf9d7b-f5zmd with ESMTPSA
	id oF9UGbb/HmZCfgYA0LkxHg
	(envelope-from <andi@etezian.org>); Tue, 16 Apr 2024 22:46:14 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002e68c5243-4e32-46c1-98ab-2d0609c91c32,
                    38C292890E232DD6F9946AE994780F0893807590) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c@vger.kernel.org, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, Shanth Murthy <shanth.murthy@intel.com>
In-Reply-To: <20240416063125.2303139-1-jarkko.nikula@linux.intel.com>
References: <20240416063125.2303139-1-jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: designware: Add ACPI ID for Granite Rapids-D I2C
 controller
Message-Id: <171330757245.1978363.11162281828037312757.b4-ty@kernel.org>
Date: Wed, 17 Apr 2024 00:46:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 18426196401814309513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejjedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth

Hi

On Tue, 16 Apr 2024 09:31:25 +0300, Jarkko Nikula wrote:
> Granite Rapids-D has additional I2C controller that is enumerated via
> ACPI. Add ACPI ID for it.
> 
> 

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: designware: Add ACPI ID for Granite Rapids-D I2C controller
      commit: 071bbbea7aa850fa1e93b2ef371ced3232f0fdc0


