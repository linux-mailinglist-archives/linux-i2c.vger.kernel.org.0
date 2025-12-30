Return-Path: <linux-i2c+bounces-14875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9BCE9843
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 12:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0119930164FA
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 11:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815902DE6FC;
	Tue, 30 Dec 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPJtG9cU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AB239E9B;
	Tue, 30 Dec 2025 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767093197; cv=none; b=qsVuBUqm3gbdL8UWPDU3I0liWFEX1v6APnYXR1Lb14qXEljN/uyi5kOiZxR2fQnB3w9Ksu7T8UVNX3eoi+WCaJocFRdqxjM6FeM9Ag2LIZsP/Mf/4LZDwv5RuuZTOpTmT+OSDOUhvdjhsR8xaZyeUJImDEgl/n3wgyR5f9lv47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767093197; c=relaxed/simple;
	bh=uKBgDHqRAj+2uQNx25gvY4/WPjgzfw/ys0BHYB4op9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nabD/lKUfSYarDDrqOfMZUTarANiddY4DvDypIaoyIrH6o8JYaFIdyNThkxLhiJf0Xcet7HI3WwZ46+jMOYh/rpga/i+L4F5Lj2DzCUj0Eq8m0ACBtMUk6GegziM/2QUL/aOBrUnHB8mEvCGULHM2QdGsdmb+GSCDMJlK2JETOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPJtG9cU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4DFC4CEFB;
	Tue, 30 Dec 2025 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767093196;
	bh=uKBgDHqRAj+2uQNx25gvY4/WPjgzfw/ys0BHYB4op9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UPJtG9cUcWLPyl3kDRjcCg6gVtukp+6LNBNeL5TPl/Qb0c+JH5ImVgNVw08ri7lmy
	 a7WlWlEuIEHPvVWawBoV7K9+oY50kkzG7uDPT7DXx3KS9jSvFPz1DOasR3gsv3wu5S
	 119z7FjVgfBNNjXPBA+L5SX7+xEOI73kdJUhr+wfXwMatsHLjMzJIomhKOmZ3jzRWa
	 wlMTejn/D8MGNbn+W8jS8tolzaMRXjOJQKSexLBpnSteylNgMLbOzCNvQCZE8Qtuy/
	 OqOl5M1wSu7G6lFc89vLQeSlsK6n4swhOfLvOw/5SetkMZIEFUjJHPin1pMNx4gxoj
	 QJuIbkpCPxhkg==
Date: Tue, 30 Dec 2025 12:13:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alexey.klimov@linaro.org, bryan.odonoghue@linaro.org, 
	jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, psodagud@quicinc.com, 
	djaggi@quicinc.com, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, 
	quic_arandive@quicinc.com, quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com, 
	Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 07/12] dt-bindings: i2c: Describe SA8255p
Message-ID: <20251230-crazy-eager-goshawk-ac4743@quoll>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
 <20251229045446.3227667-8-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229045446.3227667-8-praveen.talari@oss.qualcomm.com>

On Mon, Dec 29, 2025 at 10:24:41AM +0530, Praveen Talari wrote:
> Add DT bindings for the QUP GENI I2C controller on sa8255p platforms.
> 
> SA8255p platform abstracts resources such as clocks, interconnect and
> GPIO pins configuration in Firmware. SCMI power and perf protocol
> are utilized to request resource configurations.
> 
> SA8255p platform does not require the Serial Engine (SE) common properties
> as the SE firmware is loaded and managed by the TrustZone (TZ) secure
> environment.
> 
> Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


