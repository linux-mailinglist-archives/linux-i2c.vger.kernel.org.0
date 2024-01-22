Return-Path: <linux-i2c+bounces-1405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB86836198
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 12:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4EC91F27AF3
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 11:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AD44D5A7;
	Mon, 22 Jan 2024 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnyQGiH2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEDF44382
	for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922127; cv=none; b=QpKfSkdZbeH0p16ucC6dohJ12V/lpCbQ0VM0smtNu94QVKoTvTzr2tT0pDPlWqyT2queIkfYjE2RjyTpNzkNBaO1y65tceCaPnr6oOEAvc4GON/HJ7XiJIIe4lz3P2QYqzHw9FnVjoTcqwV8YwJNNWrgzTpAAtxk+ZC2iClEjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922127; c=relaxed/simple;
	bh=albfJglPJn3ssNA9OQ0+BcTtP0NJbKv2rqqOBTOmm9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=foF9x4bIVZdbtgUDBCgtS50Zh1WykwMnBmvFysrpOP4N5gCUiZXipMJ1fdP3wnZIf8v/X9ePcLcEwP4+cUh5QvnMW//76outvh5HStVqIsj0liI+vW96owUzQYcvE8kVcwRHZQAUXWMo0ULxqAGVPcHbC/mjkXIPWtnPzwx6avU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnyQGiH2; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso3429442a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 03:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922124; x=1706526924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB7OVA1P0mhrGxcomQ6lLJeP9poLHGdENpnblkn7H3w=;
        b=OnyQGiH2hfm35vhwJaNyRF/1gaoaKQJOVFANLcBtoFAaYXFH4wORrzibT9pQoHYf4Q
         ZUyfa093qPhD552D6RdD93mx6D1FmnveAtF3F5IhElaUplyB3V8wM2LtnLO0FD2A1xeM
         iS+DpLuox7oE0IqxVNXQ558IRaSd2EVk+YT7h/Bsm9KJIl4jkEEhsR40oF09umfeJjqk
         vtgBYUtzda9bmToXV/UVh5LogK7dyvDdRIqhzaS4blgLKUV0sxIc9oQREL3Ow3lWmaxi
         bt+gqCAKrJzIdKTQXA7e7JeS/ZkKNiObQWyQcFXE7mofC//ykXRvIEFax/QUy1Ua8ZZc
         McBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922124; x=1706526924;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB7OVA1P0mhrGxcomQ6lLJeP9poLHGdENpnblkn7H3w=;
        b=EyLdTusoqrnhskygVzB3xRFN6nHsRRoksh4vYaxePitVcLHp7YVogzK73gK1IXecqH
         X8kBiJu5LwLtwLqkZo55eThtKl8cP6/ca7shfB3MRPw4wUGQ62bpHMs3EMaS9UqakCz5
         1czL6B27nRRFCGBsh25xKnaEETX81Z57DWwjH32PGcL6T75FszbeU+UVMIckN0Eq0kPg
         1bQVBClYGZxlJOb5zKVTTTbC3Nvqz8xVFA3LuYPGwZa41IE0mzJGt6/nczslZTl5mmhF
         RZH4wot8RbTPQdWaTHP0Gs9LUQqXa3LyKp3w4A/XcBFnWvD7gW9+aUsPB+aYCPuh/pAW
         EPDg==
X-Gm-Message-State: AOJu0YxH/AEnwF9M+Uo1oa01xMtVA8tgUeFfZ8b0RGNWuLO4yY6QznyR
	Tvc4KGL/99eGHfJ2QrYII3oXKQHof0n7+v2xui1QrOx9RHHZFuCEUCMP+7DhjBY=
X-Google-Smtp-Source: AGHT+IFSPy9JFcq1dRkyFAlcLaJyWOEFdcFz75lX719Kgl3pUfgnHj0jC82Yo2VkfKn88Qf470OoHA==
X-Received: by 2002:a50:ed9a:0:b0:559:fa7a:d6aa with SMTP id h26-20020a50ed9a000000b00559fa7ad6aamr2114097edr.61.1705922124368;
        Mon, 22 Jan 2024 03:15:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240119111132.1290455-7-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-7-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 6/8] arm64: dts: exynos: gs101: update USI
 UART to use peric0 clocks
Message-Id: <170592212285.45273.9589761352391920632.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:22 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:30 +0000, Tudor Ambarus wrote:
> Get rid of the dummy clock and start using the cmu_peric0 clocks
> for the usi_uart and serial_0 nodes.
> 
> Tested the serial at 115200, 1000000 and 3000000 baudrates,
> everthing went fine.
> 
> 
> [...]

Applied, thanks!

[6/8] arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
      https://git.kernel.org/krzk/linux/c/e58513b2ff78c70805d3bd7d96bfd76576d4c9e3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


