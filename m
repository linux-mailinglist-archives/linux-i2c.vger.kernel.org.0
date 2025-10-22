Return-Path: <linux-i2c+bounces-13727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A87BFD001
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 18:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2DF3ADB71
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 16:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8A826F478;
	Wed, 22 Oct 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQ4wMGVr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F0026E6F8;
	Wed, 22 Oct 2025 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761148839; cv=none; b=YwVNtD89LKU0HzfC+QSx/UDqJg0hsudPZLkusk3URBResKnwog6J23UpE2jVSGm4m/u8uJeRw82KLOujQdhZs4AhV6fE5TH3H9FcchkUmpyqZdDz6NYPBKulwBKYBvkj+3s8uZ2wOsvNEUraMxxOvKZRx8QWAoAm2MGiNj+JYzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761148839; c=relaxed/simple;
	bh=iJWl0LdiMWT7o2aIAcmE3+F+1RtVXkKI8e4PpYCoz5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILraOleQq5GHEJ1iw2l5peEJK5J8KVjXMu/FSUVaAc/qrBMK15wDr4sZUI3mTel62hJUr7h2Xp9aUUEM6cXT1lvJRmX44RolE1PngOx7vlWsUc17IGoTZS7NZNEKYybwVxbFHWpwpErHSzUOvvyHWyrZvGrnKoWUjjtxq69Y0xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQ4wMGVr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08414C116D0;
	Wed, 22 Oct 2025 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761148837;
	bh=iJWl0LdiMWT7o2aIAcmE3+F+1RtVXkKI8e4PpYCoz5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UQ4wMGVr6ibfS1rY71i2UBnGI57CnAMAmD2/nScPuC7BEt12krL2HU/hJFLU9yI8+
	 2UV8EXQ9GKC2Vf7/9JjaEj8BPUgtkDGWWO+yKGMpSf2BaQvfDDjeP4PNamtFeU+laD
	 4VuYPJWCkPm886/V6B9RI1/exZqinCKsFVk7QxBCqBxOYI0J8GSWmIDzLcwT4geT1/
	 as0QgrRv8Tve4lvSLrzYHMV1sayvkf0OihXlf1vMUDOqXRr5pZ1ka09Q7Q1vqpRsfN
	 nWzDZlAoh3jLREHIwtK5xS2EOx8UOyFXh7A7ZoVeQ5+TI70cwIicb3m99XQmmwfIH+
	 zje7ByD2VLWLg==
Message-ID: <3d2b0de7-4c39-42d3-a6fd-d41386559e1a@kernel.org>
Date: Wed, 22 Oct 2025 17:00:31 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
 <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
 <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
 <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
 <48bede40-584a-409a-9bca-7ae3cc420667@linaro.org>
 <124be1cd-1cc8-4c04-8aca-eede808e736c@oss.qualcomm.com>
 <wQXRQmbUmfMvej8K6_8vXS41CKntPY998YjO9D3oixzxaMuV4isW-ebPocmhNjppbBpEvXx1524Q-BT-UHfh7Q==@protonmail.internalid>
 <6efe686a-fdd5-4f17-a0dd-d44a16a67a36@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <6efe686a-fdd5-4f17-a0dd-d44a16a67a36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2025 20:19, Vijay Kumar Tumati wrote:
> Hope this clarifies. Please let us know if you have any further
> questions. Thank you very much.

Eh.

So can I take this statement as Review-by: from you ?

That's basically all I really need here, RB or NAK.

---
bod

