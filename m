Return-Path: <linux-i2c+bounces-741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0810680E1F6
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 03:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38DC51C216E3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Dec 2023 02:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1D73D92;
	Tue, 12 Dec 2023 02:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="Df9w9eNh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D521B0;
	Mon, 11 Dec 2023 18:40:09 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c4846847eso15362715e9.1;
        Mon, 11 Dec 2023 18:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1702348808; x=1702953608; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zAXD1RodxLCJLaHsUmAJZ2pqAt9clRdJT0+EpmZ3Uto=;
        b=Df9w9eNh9ln//OYAh75cLwnZK37TcwDWM6U1ISnJHs0ziLCRX36EspnRsmvvjHDcL4
         umg1XVdo4i0fexkDTKPiIhBmfD9oDQ0cbhZAWhj7Cjmv0Vjbylq7w+xxdd9G+ykZ3Gpq
         mWm2F0GySqdHZjjxsLlJHOmO5l9DiVpaAAAbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348808; x=1702953608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAXD1RodxLCJLaHsUmAJZ2pqAt9clRdJT0+EpmZ3Uto=;
        b=HYzN92CQ2mpm49TqT3leUevVPZRWvXMXXgCzlt2ZloQX4QTluyz+WO2oJwFHZjeitJ
         P+rIr4mjcMsWOGJ0pVhjrf9gWm7wxjYY2UH2aUQqD3IERVafSrQbZfQd96zV5/lKMO3e
         AQsv5Y42HEBuMlAWSrlxIJL/4UHN01syvyXPExu9PmeFZzf8m9/2nGlUikpRLHmYORML
         +v4lA7/baSS1xqhvxlabyo5vRYsIaXwI0UaygsfuHc4zGi9buqB8xGVOWuxGRy8IdgZI
         1gKjxaxpgNMuKsTeLF22mik2LqOP+O1kpM+9J/DJnE7nxXs9z/Ec9zC+vZ+4OGSjOirz
         jkWQ==
X-Gm-Message-State: AOJu0YwCZYg9rUYXxaXrCzwn0vuVRa4Sj4ZBGeDj1vZAoPiwM+lg03Qa
	gwdf7qvn7GIvHqmmvfzC3o+jgLbViXzf9sApzXY=
X-Google-Smtp-Source: AGHT+IGro7ebzIbDoL45S1IR1W+QmdX6go9COEOECHXrDlJuyCg39Z2Svxx69OR3G5dk255FoNyjGuIcZuMlOJIug34=
X-Received: by 2002:a05:600c:11ce:b0:40c:377c:4b62 with SMTP id
 b14-20020a05600c11ce00b0040c377c4b62mr2683948wmi.50.1702348807434; Mon, 11
 Dec 2023 18:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
In-Reply-To: <20231211102217.2436294-1-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Dec 2023 13:09:56 +1030
Message-ID: <CACPK8Xc6-M9fsx3AUPobzvG6sjCrr8Sj5B3Q4Onp5wGvMm_BrA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] i2c: aspeed: Late ack Tx done irqs and handle
 coalesced start with stop conditions
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Wolfram Sang <wsa@kernel.org>, 
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Cosmo Chou <chou.cosmo@gmail.com>, 
	Open Source Submission <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, 
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 20:52, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> This series consists of two patches to handle the below issues observed
> when testing with slave mode:
>   + The coalesced stop condition with the start conditions
>   + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
>   read request".

Looks good. I've reached out to a few people who use slave mode to ask
for review and testing on hardware. As long as they don't come back
with issues, we should get this merged and backported to stable.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

