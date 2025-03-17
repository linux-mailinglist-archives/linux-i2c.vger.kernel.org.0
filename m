Return-Path: <linux-i2c+bounces-9867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BFA654E5
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 16:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 623483A72F1
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 15:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B33424502C;
	Mon, 17 Mar 2025 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWclU53B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1C214A9C;
	Mon, 17 Mar 2025 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223833; cv=none; b=gvtmlGeFS/SDLp4kkXn/PiXFLw7awG3vFEeg+/7d5aMnTscYgUiY4+vE4lSulGGSVV5nISfGvvjAeNb0n8WQVkVPkWgfSpChY5Bs1H5R5sQPjVT+nuJ1DOoR4+D0yk5OOSfs6fvqybfAKbGxJIY0+hcRCBndZGyTw2+WRT52vVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223833; c=relaxed/simple;
	bh=iLaRuezQt/T6WdqKcjHtAOTkdWPLu5drQDYl8LyIh4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t31ZYmyFiYuAzYZSiDHx8UM6naCoo8IW0KOqWaTAo0dSA5111GdUBiQLgGdmQUSfpjGpDs4+nAkMlg9QKD5kQM3ZgPKctsFLqqzId5BnVYUqxeZ27df1i/KdlLwuo4+/Wvoou1Vki62kB4JR9cvLSnPFJpaLgOLNnzeHe8sR5FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWclU53B; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff65d88103so3747286a91.2;
        Mon, 17 Mar 2025 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742223831; x=1742828631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7zFlRnzaKGS1ESWbJzZJmSvwNNhlBm1rOh71RWWkM8=;
        b=MWclU53BXM0dUuwYlgWaaqLDmWEknFgARzAceys/56fStvR+rlHWH1kx2ie01Zt3hZ
         SmRsR6TnIuL31bx996gc2Se/hEZ8wtdWzvHh3FQZfoQ5PY94M+jKFaBlEf3xlcNcPXfm
         ykmLVtgasoCyJT/TIWIlXlKlqeKtbTNhw1JKrSloFjWShwqG3frUK6HckesJBgkDJjVi
         Au1Btx0dGODP6kY+tWuLjD141ksDKnZuak7IRjdQWWQX63JF+Yo22wYRVrathIViBr3K
         XGdo8QStvsPI90c/wHoscUn1hpACQVM5C7Gk7AVowr6dBcV1whSgNbqBZxCbhsU5/GsK
         DM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223831; x=1742828631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7zFlRnzaKGS1ESWbJzZJmSvwNNhlBm1rOh71RWWkM8=;
        b=dxC6qTKr0DL9kj54iv/xFmhy5mVCMk7DNWeru2mopNkQ0/09ypBqbVGjOLaJg/XgLp
         wHe/Yzk0TRlTwKYG0Bxa9PL80d3blsPkMNF0S+WftN9xBmMz1u5aBdcMoCcG8D8EM9wa
         NwJ3tXtVfp/DU319OSP7bmD8kZvmz06JMcfEvCo3ngnTU34+xUDyDvjpXndNbEWexwt1
         tJ4ACAqqibzaDvh7+/O5sM5SFQBm6snE+b6YAr6dAbNtDYWE2EHCPHDTZuFq3eY4nyNM
         yblAKuw52qFS6Ww/yXe6Np2yKuhyDTgmFet3AM8foNrnLvUxoQdT6SqHnDTQanAzDooz
         gyOw==
X-Forwarded-Encrypted: i=1; AJvYcCU0ui0Uspm1QbizUT0006XmmZUdTDOxVz690DoFk1Uh/NfDzquUZjlaZcfWERvv+uGYjqI39+BqmEHgKQc=@vger.kernel.org, AJvYcCW4eTYYUe25vlaFWS4ck1nhIdIxg2IjErCtiX4k0MO4oC5nHv4Wms5pudTZ+jxgWLbEs3uL5lnFlvNs@vger.kernel.org, AJvYcCWUMz0etO75QFInCLeiXZWVpr2LC0bjD9atg6V0UqxV3G0UUUcCCw6IJgvhV3l3Pz0wEqTE8QfeQZhQ@vger.kernel.org, AJvYcCXH2xdtQhP46ORtaxidEev3b0CbmC1U4zrTjVuZF08wcquutapcaxvvJmLcHBSAZf92PoIL5Qcs0PZE@vger.kernel.org, AJvYcCXQqHMMssrLp9SkeaM3+U6LHGCiv1awbNYAaZ9DUiIRUkAapdBLyRlFWpOIJjM0OCCCz437nlIgTYoCNkBh@vger.kernel.org
X-Gm-Message-State: AOJu0YwrS3l+xVZQHhY+pqbimOPNcfBw1vQLx5Mgn22Im1EQTB5tdtaT
	4AppIlzZbZ4OVDyhr9p3TL4gniNI4Cc7Jii9CJgHarXosMnxtPpD
X-Gm-Gg: ASbGncukrS2DcTHHyeIhjc9Qo0iZT5HZs9SrB2r32N/icIu2DNqKWUeLZn5e8zx/ue0
	UudpFid2WfKIa4Fjx7zguiCmPBXqdD2AUkbt5zdZi3CqfEFEyNfuOcIcgWWXwe8Obg4koln1CaQ
	C1xq1y07P9mL9WbnB423Zbf+oiqq0d2KUi4YnR+Lu7vDc8CrVjjYeSWIv+c4DsaTShw1aQ5n5wS
	ZLktrGq9Rx+iSrcu80Un2ne1Wr95QfqCPO/dKsjL/LseqaALiwrVlIKG36yHobVK+Q/kt3AFWkj
	3ilGlXcu27U+fHBfiI7aGDfcJtuTK4Mra7iu7uFjbEIPvsIcy7wGpDcRpbt1SwB04oXR
X-Google-Smtp-Source: AGHT+IEMJCyihgu3hzsFLndhdamegaKRSNOI/PrpAIwIeAiZP72lHKTsSrfRsiClc1hAcuTcucAYKQ==
X-Received: by 2002:a17:90b:544e:b0:2ff:62b7:dcc0 with SMTP id 98e67ed59e1d1-30151cbb8cfmr17316504a91.15.1742223830879;
        Mon, 17 Mar 2025 08:03:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539ed074sm6141166a91.15.2025.03.17.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:03:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Mar 2025 08:03:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Cherrence Sarip <cherrence.sarip@analog.com>
Subject: Re: [PATCH 1/3] hwmon: (pmbus/ltc7841) add support for LT717x - docs
Message-ID: <6cd68f79-41e2-4400-84ca-d07d178acc9f@roeck-us.net>
References: <20250317-hwmon-next-v1-0-da0218c38197@analog.com>
 <20250317-hwmon-next-v1-1-da0218c38197@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-hwmon-next-v1-1-da0218c38197@analog.com>

On Mon, Mar 17, 2025 at 01:02:25PM +0800, Kim Seer Paller wrote:
> Add LT7170 and LT7171 to compatible devices of LTC2978.
> 
> Co-developed-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>

Applied, though I changed the subject from "ltc7841" to "ltc2978".

Guenter

