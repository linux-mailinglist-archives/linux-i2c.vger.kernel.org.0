Return-Path: <linux-i2c+bounces-4591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A781924850
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 21:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAA7C28A25C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 19:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7AF1CE09B;
	Tue,  2 Jul 2024 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RH1OjcfH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D764B1CB31A;
	Tue,  2 Jul 2024 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719948552; cv=none; b=MD7A50X5gj4AhijWNWOQqF4KBp/VRfWMrR1vfHGNT65Vop9H/A+mzeLDIvLfmm2yioTLfl27beOgTjSh7cTIxfn1FvCUv2dVNoCCUHnOXDgDYPiyeySUqJUdvK3QpYQBlEBUbP00pr3nQe/D1XkNB/eSsFXJdrIdBKKLNy1zH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719948552; c=relaxed/simple;
	bh=CBWZWmuugeImQuT2m4SY3zJJM7K1jAR3HFwIw9QBHR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbvgVUTenrVGSHwLQ/EqVZn+sBJcMRaHD2ggD5jKrjWLnmjLcTP+opShUiZvNBjDvq54kKqL2kLmg0KG2ng2spN4TADDNnEdISsV1Jm/yui7ATR75loZAKADx6AiJWHVxZDxqQ5dVwiVYEe68gE8g6dd/B/fpbOuzWCsYAE9UxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RH1OjcfH; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7066a3229f4so3018019b3a.2;
        Tue, 02 Jul 2024 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948550; x=1720553350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4NCTmI4coc84e5gkxcvjfWMDSk5YUBVomKbGjgxM2A=;
        b=RH1OjcfHniPjVRMDrsBixFbk4PAebY7jQG/VEG3OxMrjusstrVpXtxzsMnxuhRtgrz
         wijq8iwQ0Dqt11eQMy+z6xsTeYme64RKTTDQDTpjqImwi88mevEoGvSBgN7BJ8nvj07/
         8aE7uOGFx4rrkRRuQkcr5BZ/GZZWhjVlDqDk7BS/dUjI4lZMN23AeUqw47RYhicdTDyf
         D6adExbpfLLyyI3iZXUbtRKzhckzRnGwspk09+dW++1lcJqsvaqcc0h5g7hgPVvUzyR4
         DSqQT1F0X9AwI1NdqLZJs3RVb7tyVn7J3378LuwcYUN2eRhEZT+ZhQCqbEnLwgs5vLio
         uw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948550; x=1720553350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4NCTmI4coc84e5gkxcvjfWMDSk5YUBVomKbGjgxM2A=;
        b=GgEzt1NfD89ZDyoVOMRWEggg+E/EBFLcmhyfYVvNwXBJTc197isHUvHtGTN/bXVNKg
         VRPz1kiOCSfNVn2jLt3LKkvYTEdSjicJewwAzRF78zK83aActHL+EJ6Vk9j6LCYuKZi3
         fm1TQcT/aILH8n6FvgKmOtsgfS7eVtnwpquMLff/XtgFnw3OO0tk3ZCipVw1/uFjSBSs
         r//xDGjfoEjuKgXUAr7hr7iWImJiPgdQBqVxWuEoTwu4imB40EEU2Aqmkm9QN3L2H/Nq
         D4EE3Q6UDUmtyFfQVve7BkvP4sK6bqY8H7IuWk1YbE5ZjpyIIvyM53ZDfvXfonlToN9e
         WRmw==
X-Forwarded-Encrypted: i=1; AJvYcCXq8S5++sM7S24dxkg+ZjYKStK33KYPXLLRSH5OtxNm3LuaFmoHa76YrOVDF6mbhn7gnppq0NbSRd8MG6yYeIUoYLfeWyY4Vc2fW4cV7O9WR+fcEa/e4PCaGBIX78wm5K2ChNxCAWcSFAO3JFX9O59L7LcYkl6i+myEqn9lj6KVbvKro82RBGPS1BwnNQW/i3LRIwRm/F8ffwgKIhOQGC4dMNf6ICln9XlGr+QK4eGcB+wR3GMmteT9rD+Y
X-Gm-Message-State: AOJu0YzFL4hVj8pJecxdV2tzSipBOkuGOUPFKxRNNmGyUgmlWbUfphjE
	DMnEtIu9Q3Nr+J3pDsMP5wV5pLUPk1XAsTMk/k2z2MYF+XL3rb4V
X-Google-Smtp-Source: AGHT+IFSlkcx7+6K80XNhQ8XSJJHHVBy3ib9ITKLvGpGc6h9GHUm/8KgUk8oukAES3IWcw0avTXE2g==
X-Received: by 2002:a05:6a00:a8c:b0:706:742a:1c3b with SMTP id d2e1a72fcca58-70aaad388a7mr9228268b3a.8.1719948550014;
        Tue, 02 Jul 2024 12:29:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708045a9f52sm9197225b3a.177.2024.07.02.12.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:29:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 2 Jul 2024 12:29:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Vdovydchenko <xzeol@yahoo.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add MPS mp5920
Message-ID: <cdff38fb-ac8c-4f5f-8067-aa99acb7c677@roeck-us.net>
References: <20240702115252.981416-1-xzeol@yahoo.com>
 <20240702115252.981416-2-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702115252.981416-2-xzeol@yahoo.com>

On Tue, Jul 02, 2024 at 02:52:50PM +0300, Alex Vdovydchenko wrote:
> Add support for MPS mp5920 controller
> 
> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
> ---

Applied, after adding Conor's Ack from v3.

Guenter

