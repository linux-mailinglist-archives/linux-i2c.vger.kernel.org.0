Return-Path: <linux-i2c+bounces-12363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15ADB2E6A5
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 22:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B6A417F707
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 20:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13132D2482;
	Wed, 20 Aug 2025 20:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Su8TnsN2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE6724A067;
	Wed, 20 Aug 2025 20:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755721875; cv=none; b=MQZHish3jpWzVwC/yTHdc2KfD06TPIzWVkLrdwubsVQJxUuNmAk2vzxxMQStylYK8OEr+X/zPb8IkTrMOw9JsLrXh5Pe4E/sMK5NxsE5IF6kCssgNA9qHI01BWX3LKwCW/bdGLm2IlLHAuMJVt4pcBTM2vFD1W0zV2qCP5NPo4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755721875; c=relaxed/simple;
	bh=HV9ib1u6sZEDXsB56fnVQreiHI4JE8NcawRWEwj1EFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqvGPkcSxwLs6x8bOysu4QiQ/5Nu0bnk37TMzZ9B+b1CsoMxqQLKiLAt4zmq8k86FR+o8zOtoJD4hKEQOVFiGS2g9EqMtpkml+OVC+LmGbmZJprmOs7aIYZtSJR7UeHZU9kIjZRXHUFcM7aX7ejz//fXwEXh/yxcrQPOQMjPUJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Su8TnsN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D65C113D0;
	Wed, 20 Aug 2025 20:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755721875;
	bh=HV9ib1u6sZEDXsB56fnVQreiHI4JE8NcawRWEwj1EFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Su8TnsN25SdbgdvQYL7fbuLEdTEAPVTpUJm+Bc5b8d3o42rVEsOQJkp5hztZJ15BT
	 I8kyKiqeAv97phHyee+ksUuftIS+n9BbcDTvNUMCI4zwW7JjwodYWJ33n58nIsa4p4
	 B3jG/AOY3Z+uug2b8pL87dfY5Q2xmC+zgSIkLY9+tbynjCkNv9r1ZKaoKueeBeFDEZ
	 WsA2eUIogV42Cq5z0jfmEf8VVphhdgrEVVHRzY06+08RIUY1i+bDprVPSt/rSan0Xl
	 VvQCVXMPXfDWndA4IYvaiX/P9y2OJQ5+816Vdq5FNIfwy9gfgBkb6u4KaBBId3+/T8
	 xSlg7sPW1qMLA==
Date: Wed, 20 Aug 2025 15:31:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: vladimir.zapolskiy@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
	todor.too@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
	bryan.odonoghue@linaro.org, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document sa8775p
 compatible
Message-ID: <175572187383.785125.6427441804080019104.robh@kernel.org>
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-1-6806242913ed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-rb8_camera-v2-1-6806242913ed@quicinc.com>


On Fri, 15 Aug 2025 15:07:17 +0800, Wenmeng Liu wrote:
> Add the sa8775p CCI device string compatible.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


