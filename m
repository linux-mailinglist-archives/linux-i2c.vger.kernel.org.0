Return-Path: <linux-i2c+bounces-8933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9CA03015
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 20:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E8FB162BEB
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 19:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410D81DFE0F;
	Mon,  6 Jan 2025 19:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WS23p4cj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D614B94B
	for <linux-i2c@vger.kernel.org>; Mon,  6 Jan 2025 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190042; cv=none; b=jqvcLBu7FWol/cHd0hQceG7bovgRD5h1qwThI90VqFdFD9oIDOrjzVXNGcwIImjOHavS03DdZw8RjBTRojcFZCi1TzslJx1IvborMzJhWqUsCthrCCnqvA+IGXPK330HRo8fVa9yXg7azKaycUCvjK7uTLes0+q20Nc3ILxyv2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190042; c=relaxed/simple;
	bh=B7rVRS91AqCk9yDGpsv3634h2LOcw/WLlfQL1LFLPMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euk120KGmfF8IzXUSmUznuGk6Dh8l44ti58AigDYBKdCM615GbOIVnRJYVlC1nOuGCBFzMy+Wi3j7fDRd7/B9qmIUEK4z+g7xc8fDGU30KO2v3lzVuJlwYmhfkhDNxgH9UI1KLk3cKBxnJR2+sNCM2DQPQmfy7ZEHI3KujlE7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WS23p4cj; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afe99e5229so4149785137.3
        for <linux-i2c@vger.kernel.org>; Mon, 06 Jan 2025 11:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736190039; x=1736794839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/SamHPw263yrqg1TIgcL3Fr0uDVcwI04kQhRloNiwTU=;
        b=WS23p4cj+QMbGcFc7AI/LSfDzB8ykseywrvXk6LB0gAzL/cRp1Lm/tyBzK1PlVJhE6
         hL2mApDI5yYv0ynlY3OaBE4tyPij8QMQm6PzO+0aCMKOt4wP0RN3Zuu05zGplQiqBsfr
         /fG9QRVY94AoJnAzvyCh9bdDVRRQnri+3GiABcBNi11A60NmL+/7agFKPo7tvbeCIeMq
         nyAkqfUruwMmpO6W8xgb/iVwkWZv52kwwYJ8fLEEZT3i0d9e58wcpJ4WVPRWISH015ap
         Gd/A6aCuG7wQtvuiCimq3bPWMCcG0/UntmrnMpvyylKtcygBFntFzH5zVdMQinrAjr52
         swjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736190039; x=1736794839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SamHPw263yrqg1TIgcL3Fr0uDVcwI04kQhRloNiwTU=;
        b=nKy8nJphn8vKuPrcQWo6X7MujohePewXF0wEeiqJs0w2ucWZGXd/Wca9+JTv8S9QkL
         9yk+bbycX7FgEvxwBrNSkBj0+6IaI3l2/5s4imAMsXNdQsJwNorV48v3T5wse0gQvpnW
         U9DCxQe/yXa2mIxOws9cP9gckmaMJJA/zLe2cPtrC8/UOoqX14QeMwMdiPNm/Ua3yMO+
         pZ1nDYKK5GVOPe++xKzZuy1mKjnZoyLLX3X2HDIh9PCCW0DuAB4Kxl4NYoVJCDXPUyRy
         Qkxy+wlWOz99YLtjvsK6i/RYy+ACcwmWP9/ehzMqGJLbMRSIA/kUfbdmHxmaBQDfx+ra
         0l+g==
X-Forwarded-Encrypted: i=1; AJvYcCWOo4tfrIXG81ufOctBW7W7rS1BcYlEEFZfBLw/H/VO4g/AbWNL8FOOGGAet6vxD6eD47P0SO+Y+z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIJKV7BPpSlZp6n/2Ylfvvtx81buCzMgGDnfUTPYMziJuOFWuo
	h3oCR7Am2El/muoL60p1XwlLUM2xELMeZrITL0OmnDVjFn0GKTIXCfpqGZQKLkVOUyMjcluqCeu
	yizo+O1uaf3DmP46erWuejTSJuRG6G8Tdx7dnbQ==
X-Gm-Gg: ASbGncsxs68Tk2tC51veGoBuP7iiOKlK5/gN7Dpp6vD2x8xw6l1SRig94U7kvx+GSwS
	Iuy74JEoyDFJRBwIfydvL7E7mOHCiq1HL/16lpnzFR/hkpRbNUHJnRp6grM6hGw63WX8=
X-Google-Smtp-Source: AGHT+IEfg6L+vAJ+W155bbYhFlBN7EQr9HoPXCxPpXMxSiDpusoK6g29Za4uGp8RgqzdfD1PvvZDhU7iPn1gVCTFucc=
X-Received: by 2002:a05:6102:3ed4:b0:4af:a98a:bd67 with SMTP id
 ada2fe7eead31-4b2cc313aaamr52272787137.3.1736190038068; Mon, 06 Jan 2025
 11:00:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106151150.585603565@linuxfoundation.org>
In-Reply-To: <20250106151150.585603565@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 Jan 2025 00:30:26 +0530
X-Gm-Features: AbW1kvZgDTF2dX-LsDqh7ToTptDXowuCxSxrU1wO36mVYDFbBVHHVuYoi_0Rmp8
Message-ID: <CA+G9fYuJA5eUxunLVyws_J6YNuZdyVUjTGGgGyPwFMgCHUpsnA@mail.gmail.com>
Subject: Re: [PATCH 6.6 000/222] 6.6.70-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, linux-i2c@vger.kernel.org, andi.shyti@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jan 2025 at 20:53, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.6.70 release.
> There are 222 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 08 Jan 2025 15:11:04 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.70-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

The following build errors were noticed while building the
allmodconfig builds on arm64 on the stable-rc linux-6.6.y
branch.

This is first seen on 5652330123c6a64b444f3012d9c9013742a872e7.
GOOD: v6.6.69
BAD: 5652330123c6a64b444f3012d9c9013742a872e7

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
============
drivers/i2c/busses/i2c-xgene-slimpro.c:95: error: "PCC_SIGNATURE"
redefined [-Werror]
   95 | #define PCC_SIGNATURE                   0x50424300
      |
In file included from drivers/i2c/busses/i2c-xgene-slimpro.c:12:
include/acpi/pcc.h:23: note: this is the location of the previous definition
   23 | #define PCC_SIGNATURE                   0x50434300
      |
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:243: drivers/i2c/busses/i2c-xgene


Links:
-------
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.69-223-g5652330123c6/testrun/26613311/suite/build/test/gcc-13-allmodconfig/log
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.69-223-g5652330123c6/testrun/26613311/suite/build/test/gcc-13-allmodconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.69-223-g5652330123c6/testrun/26613311/suite/build/test/gcc-13-allmodconfig/history/

metadata:
----
  git sha: 5652330123c6a64b444f3012d9c9013742a872e7
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2rGGBoqD6FxSfg6IKJLK43h9cCM/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2rGGBoqD6FxSfg6IKJLK43h9cCM/
  toolchain: clang, gcc-13, gcc-8
  arch: arm64
  config: allmodconfig

--
Linaro LKFT
https://lkft.linaro.org

