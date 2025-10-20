Return-Path: <linux-i2c+bounces-13678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300DBF17D2
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 15:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C8FC4F534A
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 13:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9313191B5;
	Mon, 20 Oct 2025 13:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWKzftpZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932072FB615
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760965999; cv=none; b=Gz+3mcMmHiSyaFwzHiJnDE/7qrgWAecO2sV7kgJYlEXJVcoM4t0oLb0GTD7MWPlB7a9V54EDxZIAINnSfGlEzw/IsFocDX6e1pRaGK240Z6y2hnVS25gmRnacfWmoXUwck9kuJE5TIByMtDLpV73W5NNmGiz2O5Z9QHmgnIwKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760965999; c=relaxed/simple;
	bh=AfTWvMNKWRx5WxVQtvE/gOVCLgHWI/aXpAmpAir+6FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJ6ABFXhFnePSjRVhLMnEaeXHeFqO9+8VsOJFGrWHuDvvA8WTsEmajFXTNO+je7iUkI2ICMGn+vP4N+8TRYZDml3MAHVhptAOBwNHU8TQ5cNunSxvyy18Gty0E9oXU+nuUVc9aPvUJcsVyCskCMiCwrtsRW51dgx/eZUCnGuZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWKzftpZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c45c11be7so4127539a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760965996; x=1761570796; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AfTWvMNKWRx5WxVQtvE/gOVCLgHWI/aXpAmpAir+6FA=;
        b=RWKzftpZCKwLRrACgMwerlwf4lY9GljdQw66d3KQsgTkv1InhCpQInhGxBfaw1n8JR
         4o1CJ7VFsoln+gwUE8JF1gVzzwR3GtuxGkumiQqc21ppksPCfPU1hwyph255WL3/2Pjr
         tIPHksEWPHwAJPksfrm/sUBjHeWlw7EHnUZ51CPk92jyHY1BQqoaDD7miymytz6bz8c8
         lW8vgudr+4Ny7VDqzHpMgoHXXUOSXZyy1rzTlT2+p6qIUJ3pTvGamzEqAM0bUpzROIzE
         ldIGKdESpqXxYRzhCDPw9Fps1ZlIu95g2du1RFMK/UWXVtIXsm8MQXU/yj9IFG3qP1GB
         TGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760965996; x=1761570796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfTWvMNKWRx5WxVQtvE/gOVCLgHWI/aXpAmpAir+6FA=;
        b=nQA/DVOo7EIQy3zDJuri+axGDdSlFOa9CeaDKLw1hwaBwYBUwoJVTDrrybG0mMZbMY
         GdT3duj6VJQJKr2+6/SrQ/+GjLCt4VmTAqrGsWQkQBRpy1x/xnPb4uPWby7QgGdeB+K/
         czusbB0fUXVp49BG8+mrzGqWuVZl7Ry4+pyDzBnLas5WkFnMQqi7nrWQ7it7pYnHDHmA
         gcJ6oAHYXcphXazYTT6tal/K4w/1rGmkzkkY+zUYDeodjIr1QgvlbOcOahqyYJ2V4qQ6
         iBkHOPkRvDnjtNdbJS5Ni1u2oigTsV1/6WS6r8RIatHK/ssujKhnW7BEx2EmvaLpl14e
         cmng==
X-Gm-Message-State: AOJu0YxpO6JMlerEP6eLGIOQ4XUFAnobIUIGCOXWX/WyeYiFRICMhh5Z
	EwrlGsgCV+lEmJlGkZ22O14rGQeFN6MHijwB9KSMHJyRt+kSFEW9TiFD3fcHqnQUsM5XGt7rF6/
	UOdy9ro/6vsJ8s92lWBxE0MChBGVxZY0=
X-Gm-Gg: ASbGnctevTGdNzOqpCJFk8QgK7WqMzfwf9ESZq3DsSjI13p5KZBGxfBrCSqCyoYZLpf
	BBrGJtattIerwJcOgGqA+KVQ739qyBsBg1vElAY1qkndokzckEP1ABWkE/NVsYAWdvdoBSHqQSU
	FNIsXuonT5MAJUGPgzEPSFSg6zB3donTZ4K2/gGZWkh7VvmYobhznFwu7aoy3ZOghQA4wtjqDC2
	EWAtDoOcEfEVw2u60rj4wTUu9fTTtB0M9NQ0aRlLEMxSlOQldbaO1/zGSZJgFujO6Ez3g==
X-Google-Smtp-Source: AGHT+IGkvCcslMuGWcKmmiYvm+IPM089px853MAXbhcNPLqtcQdtbpNvAfvMxwruriFAZmBTYFnqkPO1nTFcpLSsyT0=
X-Received: by 2002:a05:6402:13d3:b0:634:b4cb:c892 with SMTP id
 4fb4d7f45d1cf-63c1f6f5e21mr12850362a12.32.1760965995705; Mon, 20 Oct 2025
 06:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bec52694-c755-4d88-aa36-1d96f6d146e4@web.de>
In-Reply-To: <bec52694-c755-4d88-aa36-1d96f6d146e4@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 20 Oct 2025 18:42:59 +0530
X-Gm-Features: AS18NWDB1e_FyEckeUmSdlDJl4jkx28fYBY2kJO7NxW6z_MYSbVArRJYBBg5CjA
Message-ID: <CANAwSgS5ueALsrbV+Oc4x+S=A3Ucaji0WQaKCLoARii3gc355g@mail.gmail.com>
Subject: Re: [PATCH] i2c: designware: Omit a variable reassignment in dw_i2c_plat_probe()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Jan Dabros <jsd@semihalf.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"

Hi Markus

On Mon, 20 Oct 2025 at 16:39, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 20 Oct 2025 12:56:39 +0200
> Subject: [PATCH] i2c: designware: Omit a variable reassignment in dw_i2c_plat_probe()
>
> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete a redundant variable reassignment.
>
> The source code was transformed by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

