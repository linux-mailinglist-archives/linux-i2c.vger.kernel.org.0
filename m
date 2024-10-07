Return-Path: <linux-i2c+bounces-7241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B376993871
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 22:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8611C2308B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 20:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1CC1DE3D6;
	Mon,  7 Oct 2024 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot0D/w/w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11181727
	for <linux-i2c@vger.kernel.org>; Mon,  7 Oct 2024 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333772; cv=none; b=OvMr6TrMLSq/IYsu6HaeuRgGWvxhvB+i3To38svCEmH5fpLarFZHVTdgIpyBhR4GxwXxhFgil2EhLZC+bsYAUA0aOkCTJDMz1RrEaxDDSEiJImjV2AjBeeBHbT51ZsAaIRAHs+mHtUVYsdqr8Kh7A0oc9bp5viPvGfU2vo1QEFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333772; c=relaxed/simple;
	bh=RJXKpqG/zCdAZXaRRrsqMmnZ6nGBcIS0JENet9KNP9g=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=e2aBFi1OUsK4mLyWFIwUEqHH4TMobw1mOlMgOTeX7irfhdZ63lYUZWZ1YBVIOAHp4PuamUDqZvdMUDRb+UHS2FHcg10+rhcH1VdCoxwdhgztuTpRggO2MLVQrFe4NRVqwG9AqHdDux3GRjNhiuiI3Q5BdJ+5lLmhHJMxN93ftew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot0D/w/w; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a994cd82a3bso254000066b.2
        for <linux-i2c@vger.kernel.org>; Mon, 07 Oct 2024 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333769; x=1728938569; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EY00LQ+DQG2AmFiC4bcRfQFUjwOedWnl2GFUKeM/ufw=;
        b=Ot0D/w/w4FHRGzc4L1rNtirKSJd+NdDQ308lhcq5yOuvkPFnRU5ucqj7Pyg+5z6Kgk
         lZvj1BUcb89KdMuzgXy0VY5j2ijFGdW5qHFqd43gGjwqK6ghJ3wNgEGxF0iuIFRx68zO
         pj/ddMVxcO+zQP1RCD1D5mkKParQ7FLw8Tne5/j9xh238uPGD8Q5QiCorJVAuhQlGjV0
         7acCBW7/ww5aybP6piSxxUEpdUxKS9/t/kIXL/ksCKAFeAcQ/xPxbYs52AhnSCGcFb/A
         IO3wUyl5jdgN/ihPdt4881nY/xMb0AFFzibp8LdJX2vkYEwmSrD7BMv1/fAJFyJovtmv
         dV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333769; x=1728938569;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EY00LQ+DQG2AmFiC4bcRfQFUjwOedWnl2GFUKeM/ufw=;
        b=jfEd0EuOEWr9yVAezbLibHNCmwk4AnUNtnzLE5AM2sv1+Ji8uMs+BiCAn6eHXAh6I2
         c7nCMLWalpoHdq2MT5PtTOOxtA4ugsRVojhSy4do5qVgzYN+KP/Z+UqOHZzxWVSqP2ed
         tyyVkkMjUCxmtgEs3QWp25Kzp9tX1HMzqGgKh8avFbBNJ4oXp77/NFQSJwqeXlCLuAiv
         uOIxsLMxJPLbYlHqgJgUAICjbXLG+h8IYu436lcUunUX0xImhXrnYSR99YuXLIC6Wn1P
         2c27GcmGKE88os2IF/jKurJCJk7LZt5mUZtKmi/xhzUe6N/t7fg7UDYNBHPZNOv3hVLQ
         zoDQ==
X-Gm-Message-State: AOJu0Yz3gzakyCxKYga0+cdsp4jTxOyjD0w1xTaVipg1CXH2rRmwR8hN
	vON1IQSYKbYWlHqCPjq/oTf4GD+S6mxq/hilLt44LjDgqfYAuSEl
X-Google-Smtp-Source: AGHT+IFbtlQF7ttKceo/rXsIi/kvCvXEAnxJKE5rvPd3cFeg+DiKNZxttGjL9K5+2/p/nB41835hbQ==
X-Received: by 2002:a17:907:980a:b0:a99:418c:b57b with SMTP id a640c23a62f3a-a99418cb658mr832110366b.42.1728333768992;
        Mon, 07 Oct 2024 13:42:48 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a12d:4f00:a884:c611:9e1:3345? (dynamic-2a02-3100-a12d-4f00-a884-c611-09e1-3345.310.pool.telefonica.de. [2a02:3100:a12d:4f00:a884:c611:9e1:3345])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a995ae3e8absm127641466b.135.2024.10.07.13.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 13:42:48 -0700 (PDT)
Message-ID: <10d7eca3-0a2d-4db4-8498-e5b28bbf9261@gmail.com>
Date: Mon, 7 Oct 2024 22:42:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] i2c: i801: Use MMIO if available
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Newer versions of supported chips support MMIO in addition to legacy
PMIO register access. Probe the MMIO PCI BAR and use faster MMIO
register access if available.

Heiner Kallweit (3):
  i2c: i801: Cosmetic improvements
  i2c: i801: Switch to iomapped register access
  i2c: i801: Use MMIO if available

 drivers/i2c/busses/i2c-i801.c | 206 +++++++++++++++++-----------------
 1 file changed, 100 insertions(+), 106 deletions(-)

-- 
2.46.2


