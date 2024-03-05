Return-Path: <linux-i2c+bounces-2198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87287871E67
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 12:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8FFC1C221EB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 11:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C272559153;
	Tue,  5 Mar 2024 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwKWSBqC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7758AC3
	for <linux-i2c@vger.kernel.org>; Tue,  5 Mar 2024 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709639967; cv=none; b=jAgkXfURky/nZiczpHGfeYVlYsZpCyh/XB+WURnYJamfKcwflqzRC7O7JE3K2NGcs8BHVHsypDfx8jJmXojajlmye7VvueOTpQqf44cfk8RoTV3p+t4WAtmWQ8Uplt/P/6/BNBY0ifZuOz2WWF4HbPt7PtE5NRj60Hpe8TeoqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709639967; c=relaxed/simple;
	bh=8VLarsY7xO6hgS984HgyiFGfOzWJcsgDY2Q+GbSzI4s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZwOZQDoiB20xh0VNmOjGH5kgg16ShZGoFXP2J3daO03WsrBeQ+RW6UpYjwIVPpyPFUhSmtvddDcaLpeZEAPJ8z/2HfnMmlS5ipYsRYU70/zErpv0XCFNw5iMn/b3gNm4JxH3Kk72KfZqtlz1S5kBMKapAZEpXV8hREc3HSpCViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwKWSBqC; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4d35666c4bcso973862e0c.0
        for <linux-i2c@vger.kernel.org>; Tue, 05 Mar 2024 03:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709639965; x=1710244765; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mn0t/pkvNce9+2PWmz7Y1Q2+8CLlu4R5wOIXaANDsnA=;
        b=KwKWSBqCG0GRLrVFS4RHEx6tJXmoaxaHElSuozI4bB31kdG8HaIB/HCXgSkokAvKH0
         LTdEHaS1m+nYFrp9uO2Uw4+t7G1zJuzzoHAHta2mvwT3hdBTIKo49bcHNebCwTKug8Zm
         RJInNQkxim+TfYNt2eevQ544KEFf9mZjRXLFSMvGO9k1rGUCY/4+VZygyJw4cbG8Cerj
         2BY45dXmDfCW2gH3nZK4wwN/OMq6Ps+XMn0km7504/HNlsW/zAFqBegpOgV8QrXmSABC
         dqkmXGVDM3LfgNMNHNCmgxdTVmf6YmsFokfDkWz0oqb380TDv6FErG/mIwayLJg1mSGd
         jngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709639965; x=1710244765;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mn0t/pkvNce9+2PWmz7Y1Q2+8CLlu4R5wOIXaANDsnA=;
        b=u3Ck1FaP6vDuhNamtyjNvbKX9q7bJtML2Chl+oCi/LsOMP6JKJowfZo2Tl+9Pvjc+Y
         QAF5aHAHRJUeCbqPMrtTV9gCm11M4kzee5VJoy2V8tDqsSdRKECfgcavukYIJE0IDRpK
         wrlCfIk60/blNuq+zLhFc7YJNJ0O2VCZqYDZuTMctz88KQ2TFjW3sTc06e8TdXgmRIdx
         tu3AAuYyEnB5MmKUlvnow4M17rP7vn+cXCwVLzwltiXJmIaN3tjGp48d6oUG5ZFnNir8
         qDBLHDUoj1fDxBw2QHWIvZJH2cQLdaprPcS0ilAPZ1nvMAFh7LEXrvWE7/mqrnCOGkFk
         KlrQ==
X-Gm-Message-State: AOJu0YyHV+k29hDy/t4Zt7VurRDjyRVzeh4IYeQ/z4E7AA6fLFYjLVfY
	5rMQLovAl/nWst5CFgsFXxrHHVWu1q/zfZou9qwdnaHSj4Fs0DVOwyQ6le78E4MO35bAjPgeRqd
	qRgN3tMneDWsz1YxVPFhNCZiRd8cUfVhtzmP1kLrRlDerkASZgnM=
X-Google-Smtp-Source: AGHT+IGN5Hcad9J/QLmVi8iffmHg/kU/flzHDG0LTMk48TnFBOM3+9dAPA0YVgy9B5MPFV+XUGH5WBSLGbNpFzu1WrA=
X-Received: by 2002:a05:6122:2908:b0:4d3:36b9:2c26 with SMTP id
 fm8-20020a056122290800b004d336b92c26mr1473621vkb.14.1709639964677; Tue, 05
 Mar 2024 03:59:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 5 Mar 2024 17:29:13 +0530
Message-ID: <CA+G9fYutCUrni7JVzLf+c3Veh_jTscTKJtph8rPzy3xHmdxsbg@mail.gmail.com>
Subject: riscv: ERROR: modpost: "acpi_device_notify_remove"
 [drivers/i2c/i2c-core.ko] undefined!
To: linux-i2c@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The riscv builds failed on today's Linux next tag next-20240305.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
ERROR: modpost: "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!
make[3]: *** [/builds/linux/scripts/Makefile.modpost:145:
Module.symvers] Error 1
                    ^~
Steps to reproduce:
# tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig defconfig

Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240305/testrun/22956780/suite/build/test/gcc-13-defconfig/details/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2dFxOgheW9s3vzzZr8Pl5vGsJJb/

--
Linaro LKFT
https://lkft.linaro.org

