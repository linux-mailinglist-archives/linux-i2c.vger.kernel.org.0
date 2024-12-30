Return-Path: <linux-i2c+bounces-8810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74A9FE1B1
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 03:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201CA3A1A66
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 02:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2702AD22;
	Mon, 30 Dec 2024 02:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZbE5vjd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F0E3C30;
	Mon, 30 Dec 2024 02:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735524158; cv=none; b=QAFzd90LvAdk6pS6f/x6HujPIwbl3TUMxXWGwjWT2YfaRXKDxZ92FCG9d1ZVbqlBEEVtVVu09Plkq4smLHxp72rIaZEpAOqqC5Ani0Nc9XaJ9EeR6kBNn3QeSQyOnMMEps1D7JwWVhX9Dpx4rQh+xF/VvvUZ3uwXTjIr/pK9tq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735524158; c=relaxed/simple;
	bh=4VtUCj7Nnv/joJSbGmmW6tt51gimX2/gVM6QBoag2Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thybCd+61a4PDYloMDGMENIJekvenRLQQwiruuTRMP9IbQZOks3g0NNHCKlJMAT1HCDzf2LuEhYEV6n5IFjrqA4MO5gylvD55rAir22RPu+5QZYlVDXMLqOoVtapSPyuEgJJMc7cLH5EoHaa2nQbt7rQVeWpmwo4K8c7jljOr8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZbE5vjd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3397DC4CED1;
	Mon, 30 Dec 2024 02:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735524157;
	bh=4VtUCj7Nnv/joJSbGmmW6tt51gimX2/gVM6QBoag2Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZbE5vjdwRetf6MmEKXXod7pPq1IC6rTQmhbZk2hfi2ylyxamV+vcp+smBAd1ca0c
	 LsV+QXdJsr5ERxFA+MLL+H9eDSJG/jcIVjz+eaBbpFhNsCR2Ow0D7Ow2IxNn6v3uOp
	 FesYbBAnx5a42vFpyFlt5pqPIJa8/dYhYMFbHBLnMDzt2KaL/kSAganKR1AAZiMnLl
	 U/pekQOL+lWnvaqspQx59nii2zNzxVeYepCjxFCUud68nwQT8UNOeFZpj7oYpoHRMf
	 6w6USE1vwscL9ZdTsM3MnGHTxf+KCIlXjPNVY0XGW+mM+ZVT+FII4cAyrrHqKfrcIv
	 3389+zbSGcPng==
Date: Mon, 30 Dec 2024 03:02:33 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v3 0/2] Qcom Geni exit path cleanups
Message-ID: <lmb7cgkksmwweo6xv4ivwbqh6k6i6jtfuowlpjkrrly3olzhg6@tsxezikdz74d>
References: <20241227223230.462395-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227223230.462395-1-andi.shyti@kernel.org>

Hi,

> Andi Shyti (2):
>   i2c: qcom-geni: Use dev_err_probe in the probe function
>   i2c: qcom-geni: Simplify error handling in probe function

merged to i2c/i2c-host.

Thanks,
Andi

