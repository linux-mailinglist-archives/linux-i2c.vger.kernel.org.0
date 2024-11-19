Return-Path: <linux-i2c+bounces-8067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C6D9D30B5
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9371F2316D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEA01D3584;
	Tue, 19 Nov 2024 22:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foi7+E5x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378F1876;
	Tue, 19 Nov 2024 22:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732057136; cv=none; b=SMWHb9yuweZ31nCugUnT+VcKAYpUjz+Ibmj6XMI5ofP7JZPX7H5CQ6qMvXaApVt05riHlKPB1s+xR84/gi7ccTscd/7JriOTv4dVMvjXt0FZ8pU2h0y6g6geyConvQtL3ogGKhrjK6pBslfKV7dB/3pvt0O/iKou3ZJHZZbnJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732057136; c=relaxed/simple;
	bh=8j68rHYX+pS9BtciZxN2bxKMOCRShUXNq6hWSO5ZKys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpKVskZFj72UU8bIOc6W3sJvKjlvWDgLGuIygTfPTABZtgf06rL+RnsyM9wtcwPC9lA3vLEczWh8hoGpp0gUf9spvt8Z2fwJMwGk4vvT7e4+We6oIu0XjcS+pq8UGdqZiXpIvp1nXYseSzvSLJXnOEo0WFtzsE9ciQs3N3vz+KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foi7+E5x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFE6C4CECF;
	Tue, 19 Nov 2024 22:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732057136;
	bh=8j68rHYX+pS9BtciZxN2bxKMOCRShUXNq6hWSO5ZKys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foi7+E5xpQfpjuCqszsHhFAOEegPt983s7ORNU4cLh3UEhzS03msQ3s2BN6oRELnO
	 bdgT4SCgryHzN3rt1DwMXYqSevro+zN5qz5T3KahRRVvIlW2V1NDdr28etpG4egnnE
	 rG1szJpYSNLRZyTr87xD52BoXAkVaRzBXzruUwWfQf0HJzDAG+27UuYByEDJw44bGj
	 dMOVGbMaWZKh0S8bZbZAQnK2APgN7vYbKQ6OGIdRzCBuYICuVVeSOesrry3rDEiAw2
	 kYnxaxvOiWUCElCYRPqhEjkuQShi0AtHhUA8IK9JPh1sSFiVEkWzgjCt+iZrhdd4Yz
	 vyvhLyBL/virg==
Date: Tue, 19 Nov 2024 23:58:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Michael Wu <michael.wu@kneron.us>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Morgan Chang <morgan.chang@kneron.us>, mvp.kutali@gmail.com
Subject: Re: [PATCH v4 0/2] Compute HS HCNT and LCNT based on HW parameters
Message-ID: <obna3wkmrjg2i6uh7jlvhumclaeknusaq5n7ppftacycymp5uu@xtzt2vc4cw3y>
References: <20241003111525.779410-1-michael.wu@kneron.us>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003111525.779410-1-michael.wu@kneron.us>

Hi Michael,

> Michael Wu (2):
>   dt-bindings: i2c: snps,designware-i2c: declare bus capacitance and clk
>     freq optimized
>   i2c: dwsignware: determine HS tHIGH and tLOW based on HW parameters

merged to i2c/i2c-host.

Thanks,
Andi

