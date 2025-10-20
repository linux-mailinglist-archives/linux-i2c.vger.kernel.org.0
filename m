Return-Path: <linux-i2c+bounces-13686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C7CBF2E16
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 20:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23E6A34E507
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 18:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2A12D0639;
	Mon, 20 Oct 2025 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRhORX0n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FD354AF9;
	Mon, 20 Oct 2025 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983930; cv=none; b=rVcUHfRComsvrKMIr1B8LgTSpcp3PWHoYVrlL7dd3bRURvOmS1cJfPaTQ/QcWzoxPIluEJoqKlZBvGDa8hkIH893E9pZJEUitZeJWeU53h7C0BSinI6bP9ltNeoyP709M50ks3kuI8IilWeuvRWk1NnZHs9CnoXsO6FPuZkBUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983930; c=relaxed/simple;
	bh=joxzFe2ftgvQaJl/wiLcUNEZxnirroeKiHG+SASjuZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyrhOlSrEW47DNWfVbmaSq3FV+Pi6In7WcSjhew9frNxqklH4bRY3d/5PukDH3ZcSQ5gK0U93N9Anp5uQtf7XCVjZvzWwxDKgfUqOHgaaTaSrfEsXhm5s1q4cWrzg5pQl8GflSASBrCg/qrQeCl2Vvu9D10aJ/EwYnBlymE2vuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRhORX0n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4DBC4CEFE;
	Mon, 20 Oct 2025 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760983930;
	bh=joxzFe2ftgvQaJl/wiLcUNEZxnirroeKiHG+SASjuZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PRhORX0nFTOClBDAMXDfEqnG1Ir//9aWegggd2Ai88wVngnm+I0ydLXQFhoubx0X7
	 idAExnVo0pTabaA6jWC8urYgwvBFK71pXh3Gbo7qV1ZVYJDRFo44tedWJlk6tg3LgT
	 DuDy8oThlmcA8v1vyWiWrGx4nfgf1dMc4iTq1CylEJQ2TdK9NLUTAV0rKz0d6yT5e/
	 f/GCsvIbh8XJSWOukVt9K3nHPlNfl7KZINPG73w5Eko0YzwlRwKtgiiMCfnX9uzFMd
	 SfiBhBGHn35rZVVlnt1cIixry5wF18M3nlznRQLUHmTzU++YlmMJV+KyUs6C6LDK+T
	 XO6B+hxuFrDMA==
Message-ID: <545adf81-a49d-47c2-b5a6-6e6c5ab683f8@kernel.org>
Date: Mon, 20 Oct 2025 19:12:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
 <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
 <a7be3a42-bd4f-46dc-b6de-2b0c0320cb0d@oss.qualcomm.com>
 <d8dfe11f-c55a-4eb2-930a-bfa31670bef0@kernel.org>
 <CAFEp6-1zpobZNLHt1192Ahtn2O7bV+As0P1YvVHrkRsORyH_Aw@mail.gmail.com>
 <ac96922e-d2a3-4a99-8f34-a822c3dd2d02@kernel.org>
 <7140b8a8-1380-4859-84a3-681b3f1ce505@kernel.org>
 <f5a1076f-f06c-404d-88d4-fef4f7694c82@linaro.org>
 <4fb3c83a-2bef-4b15-b676-73e8e8957452@oss.qualcomm.com>
 <9Wfd4Yh9l5SbdZgs8QffP_-GOfz-TAOkTxlegxkc4w-f5boQ4b3zkavxq9yTZEKBf4HaSZIVZnuOC2Lb4EoMpA==@protonmail.internalid>
 <872988b5-8802-4cdd-b3bd-e1a8c718bb6a@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <872988b5-8802-4cdd-b3bd-e1a8c718bb6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2025 19:09, Bryan O'Donoghue wrote:
> If the only objective you have is to facilitate co-existence of a
> downstream driver with upstream bindings.

[sic] Then that's a no. The beneficiary has to be upstream.

---
bod

