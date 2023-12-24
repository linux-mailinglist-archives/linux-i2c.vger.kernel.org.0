Return-Path: <linux-i2c+bounces-993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194A81DCDB
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 23:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99C65B210AB
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1153DFC19;
	Sun, 24 Dec 2023 22:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B925lwno"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40601094D;
	Sun, 24 Dec 2023 22:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24468C433C8;
	Sun, 24 Dec 2023 22:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703455665;
	bh=C8mnLeHQXatUi8PRR1DxFxB5Q7HJZm9F2gnAe0IdOfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B925lwnoqUiwWTUVzFXBJk6xcrj1Uf6cCAXPeHNt2VQm3lsXIeqdW1knYNn+sDVSY
	 cEVc38xGpvZGVMAWO8jrlyxRfg/evDK6NKiGKJS2AQzhcaZoXR02xBzHnlcjPxFCW0
	 DYN0pix4YvNZF270znJV26NVwUbfDaC77pO8YdVk9s7O3+2JBBp4zaOIX5QMRkPeYD
	 Ysoc08XmWhvxKzCIIwdh6UFhWwa+YOL+KMHb4RJm8txbCPBzTr0nv8zof760ZdsgVY
	 3l3XMhTFTTQejQ1sAdCK96LmXtEOgB+vN5k/6kkZKkPIZGagzqqeXUCzzW2JuUBBjA
	 N8p6zL/cd3Wlw==
Received: by pali.im (Postfix)
	id BD12381B; Sun, 24 Dec 2023 23:07:42 +0100 (CET)
Date: Sun, 24 Dec 2023 23:07:42 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 6/6] platform/x86: dell-smo8800: Add support for probing
 for the accelerometer i2c address
Message-ID: <20231224220742.5cv2a7tdd4f2k4mt@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231224213629.395741-7-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Sunday 24 December 2023 22:36:22 Hans de Goede wrote:
> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> of the accelerometer. So a DMI product-name to address mapping table
> is used.
> 
> At support to have the kernel probe for the i2c-address for modesl
> which are not on the list.
> 
> The new probing code sits behind a new probe_i2c_addr module parameter,
> which is disabled by default because probing might be dangerous.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I would really like to hear Dell opinion about this change, and if there
is really no way to get i2c address. Could you ask Dell people about it?
Always it is better to use official / vendor provided steps of hardware
detection, instead of inventing something new / own which would be there
for a long time...

