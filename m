Return-Path: <linux-i2c+bounces-5006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC794932FF5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 20:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 323C8B21E20
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 18:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88B11A01A7;
	Tue, 16 Jul 2024 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U28ZRMXn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6541F171;
	Tue, 16 Jul 2024 18:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154544; cv=none; b=ZzLKA2m97bX9W37zbxBmqG1SmswuLeZXsYUf+4M1I8ny4Dc2VIb0pAhuyE99oPMmPGkx0cup2M7qP0gJHRFnTEf03p4Pltn2SO4/R0YSaC/6IGe2obA5y7tNsagZRtyslI9oSc+ODbvYhHKeeJDL6YnWjnTrbZTRuFsZ6mZ7KnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154544; c=relaxed/simple;
	bh=ea9W9VGPCZWN90TONuRkt29w4SPqAA50lpiN2tcpQuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgygSK5aJOVEVBNNJqFsKXVdDMlBTibGGixrFnBLrF4e+y+4bQLPfXofGJoF9eJdJE8eHqePjapIAlhVB+qD2rBS2siRtLIm/6e7Xl798fg8U9SO03r4fHAYgxjyGhMoOa76DCD3jpGEv7F2vuGysmHATEUSrejJBHIn89frBnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U28ZRMXn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F58EC116B1;
	Tue, 16 Jul 2024 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721154544;
	bh=ea9W9VGPCZWN90TONuRkt29w4SPqAA50lpiN2tcpQuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U28ZRMXnNSq3XXi2Boi5AEpM/9HQ6KQKmxltfogBgbHymMt2it9AJxQ9oMPpeB2K8
	 mKWifW/nf18m/LTSG4bB4PRvSKH3MkoTu+DbetHO95zC37GbW+itcnXm0tfxwMnVA5
	 n+9egst2WKfddsc5ef7y66PylMRlsHGWfI3qZ53pOnpOngQf4KgvENauJpKYsAEFz1
	 C/KIJKhn3Sycy/1zDXVWdT9ck+UMoUAsNYfDkMmIxCgqO0mGepxci2njqJQ+XVjSH9
	 mJnWYHGGw7TuVnEXpN+X6cQ9wlwk1+PH2AGhkCqZWEycw5NaVicZKFQBxVt7zG/SCb
	 4Kz81ryN0S4Cw==
Date: Tue, 16 Jul 2024 20:28:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: add description of CCI
 controllers for sm8550 and sm8650
Message-ID: <bddhmnsxkkgivevbbk2tjt6ide6grnuquw4ial4enq33ovdkrk@k4svchjivvuh>
References: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

> Vladimir Zapolskiy (4):
>   dt-bindings: i2c: qcom-cci: Document sm8550 compatible
>   dt-bindings: i2c: qcom-cci: Document sm8650 compatible

the two above pushed to i2c/i2c-host.

Thanks,
Andi

