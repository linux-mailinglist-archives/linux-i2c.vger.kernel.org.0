Return-Path: <linux-i2c+bounces-5357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650D951027
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 01:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08F631F2499A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 23:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC48D1ABEA7;
	Tue, 13 Aug 2024 23:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8iH9dsJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8C16DEA9
	for <linux-i2c@vger.kernel.org>; Tue, 13 Aug 2024 23:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723590197; cv=none; b=qPbCcU936N4iCeev61ceYL/+aolV+crS9jcb+ds/jQQS5MMed4lGFdWnsd87xlBNxZznNjEcKmaNTSN1Ya6OWYeKd5qRO/3eNfsLGVElxkYyfbPd0F80hbDAvsYjV3dw8l4KsPEmF0P2MS+RopjlLkPFEUb8N4QJf4FOCmQNc6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723590197; c=relaxed/simple;
	bh=7LLcV5n9J7CDmy2CIhvXQvZ5Ewbz9Vjb9KiBM3n3hm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErLNM7N9BXENcrwt6uP9I/XK62I/UXEUKvUfXjKxXFLCuG5mJ6Zoz0lnqqSn1SPpqcPlB1jU3U7rwFpvXZjhEM/e+SHwCjMyeVzQBrM1dQWjS6v7y7FEpnpmeSL//M3Xu2GYSSbvIaP/zQwV87a/mEzVfaAxOPR00I58vS0em9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8iH9dsJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9212EC32782;
	Tue, 13 Aug 2024 23:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723590197;
	bh=7LLcV5n9J7CDmy2CIhvXQvZ5Ewbz9Vjb9KiBM3n3hm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8iH9dsJOhLbybzPb+jm/emajgZXkvnh6wUqV0fdTvLfoeSPuqjiNtVKzNkFQq1l9
	 0AtroxwzVbFkB2PVfIsdiottETGckf4VeC0AwhkgnpAFuabhFTxNLhv8Hq18+FyTos
	 prQT2T+zCWJw7kNreFoqFqHnxzWMQJP5w7qMiwZv9SNXH6+gO9j3cgVz4a+lLb1etT
	 rlZ9KHVH1gk+WJ53nZC1LZsrWcjceluGYGSFxHz3ToWRZcwjLGlRKRkVataE93BbHU
	 sNLHIAJCsrMtIoUkjzP2aXkjCA+1efuSD9SkgSNy1Quu9fSbRhfvyZfvdJgV4oi6QV
	 9Uk883DpVzfwA==
Date: Wed, 14 Aug 2024 00:03:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 0/2] Add missing icc_disable in exit path
Message-ID: <xwn7lfpdzcsskwyc5vnvzcyys2e2u7wa4tesdr2mhdutv4svhl@6svaizuf6zbj>
References: <20240812194029.2222697-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812194029.2222697-1-andi.shyti@kernel.org>

Hi,

> Andi Shyti (2):
>   i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume

Because this was a fix I merged it...

>   i2c: qcom-geni: Use goto for clearer exit path

... I leave this one for more comment opportunities.

Andi

