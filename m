Return-Path: <linux-i2c+bounces-808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4FE8135A5
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 17:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF82F1C20E4D
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A255EE77;
	Thu, 14 Dec 2023 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCL0zb8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DAE11A
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 08:04:39 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4258b8482feso62513371cf.1
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 08:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702569878; x=1703174678; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SSa6pGgyJKtkWWJBgToju2bl1vy3r2pnMsbZh5DB9Rw=;
        b=hCL0zb8mBeLVpgdOgPunKeoPrnVKFyC2F40COCzK/I9tFdt6bC4oVX4czOBp3dRTrw
         Uc5SU6EslyXwVm+U1o24Vs6xvP3coEeUxEZhoLIxA04VcBctk30BZBxHcEtzJsJR7L9c
         n0McJRKwdJtN6Koj7UACD3rmGGGpZyc8LE21NYNqkADeR2JrN1/T5o1XJiJLYuDefL9O
         SiCz+AMviVIIcimyUZ2OK/Hfd6ltsB0Cq1JCsuYR87Se3MD8u9/QbLnYnkhBvwOJuLL5
         db7fIurOmfemJAuofH4Jlqn2aQo9Nz7t/oZgOXahACAYXW7+XvXmPe0qM8+jPJL316YS
         qKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569878; x=1703174678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSa6pGgyJKtkWWJBgToju2bl1vy3r2pnMsbZh5DB9Rw=;
        b=eRyaavfwaidU7PhRsaUNAY/CSndx+nJ0N3Fl8ya7HSG0J0bUqsvKCPgHpsByOPa6LF
         tdVVguQ2P54CqSnmLgTuE/TInrvbq86YcE7VoljKAPeXOCsgLXtEdR/ZAKMgCdMRQsRg
         gr+gOLG617STPgpTHNEw8U77S5pXGUCwHXvzmcnO/Tlx48ZMpi1W6CrXbchK4He504vn
         EkSJ1aucV5rmdEhJNYCKIGbilnoNH5Y6LsRropEusGUPreaZ4qloVksaOVjt9H3g3Jx/
         CuosoUjdnUpyyi80ZgqRiMTqaCfPt1UOqbG0H7n3zKyMOcyZWUZ5skozCIDpy1G4LDaD
         RSCA==
X-Gm-Message-State: AOJu0YwpWZCTeb1tbjsv4uP3j6yQrQOkUBYjuOrW6a60tRqWhv91y1nk
	rVzjtRRu7JmCH5xaptSptTYKodiKnRlqnKOvg7FOSg==
X-Google-Smtp-Source: AGHT+IED5SZ6xGFBDrg9Ijyz3Cz25T5pnkTh7Y3J4D3Ph83X5TDhmg/CJcC0oYf+JFNsK+/1YOVcZ7tYE3fCt9RCCE8=
X-Received: by 2002:ad4:5906:0:b0:67e:af87:6d11 with SMTP id
 ez6-20020ad45906000000b0067eaf876d11mr10979067qvb.128.1702569873534; Thu, 14
 Dec 2023 08:04:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-2-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-2-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 14 Dec 2023 16:04:22 +0000
Message-ID: <CADrjBPr=j8sjG3gwRQBGjb7G+NQ6EDcxE+XixY6mT1rf06tyeA@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: clock: google,gs101: fix CMU_TOP gate
 clock names
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	arnd@arndb.de, semen.protsenko@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 14 Dec 2023 at 10:52, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The gs101 clock names are derived from the clock register names under
> some certain rules. In particular, for the gate clocks the following is
> documented and expected in the gs101 clock driver:
>
>   Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
>   Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu
>
>   For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
>
> The CMU TOP gate clock names missed to include the required "CMU"
> differentiator which will cause name collisions with the gate clock names
> of other clock units. Fix the TOP gate clock names and include "CMU" in
> their name.
>
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock management unit bindings")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

[...]

Thanks for spotting this inconsistency on the cmu_top gates and fixing it!

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

