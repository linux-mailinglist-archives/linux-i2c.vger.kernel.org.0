Return-Path: <linux-i2c+bounces-4793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB592B870
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 13:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D915F1C22373
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 11:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A22149C79;
	Tue,  9 Jul 2024 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kooiVBi7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88FE1E522
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jul 2024 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720525079; cv=none; b=czVbqG8Nae+eSIjZqHUEweTPM1nwVvIynW3ClKZdpdmNCenxk+I395QVju865D9KtS8NWQiAQ+5WskplEcc9FYxnv6IyMdU+2Ev/BaFgKimw2Q9oaHPQ8iDVwL7kofAXU8r4sh1drpP2BIJk/ZLtSdK2wQGyQUZMDrJFph0iMtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720525079; c=relaxed/simple;
	bh=RzsfjCRuMVXjrLoMzQVrdW0dNd+mgjm3CFp7vGGdMSY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kZYPwql56ja4ABHjfQY90RB1LP6YlII9YP0TCT6D0mGCK4+3ARyj8CliogJ7jjaHKcLKRZKI4sOf7uNdu7zGCeJIqjzki1KrsLGrRye7PA3V0pNzBQpz91gGGG464kRBNr+6eiOoug+5id8IS6/xUrGTw31rCzPpOZwT+n7BshE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kooiVBi7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52eafa1717bso2324422e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jul 2024 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720525076; x=1721129876; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RzsfjCRuMVXjrLoMzQVrdW0dNd+mgjm3CFp7vGGdMSY=;
        b=kooiVBi7keS4VtdhJlY6cej1iDnEbhztBxte7rP+/hkjyiN3Ae9oLi/ldq8IiqnH6V
         vgRKvNnaT6xcXKYlqyJ8kevnVLckAbUKM79/h/ORVbIXOSBA7V6eTGVFTOiE2BAcebcp
         Pe0il5SOkGdViVJufuOsWiH9m+Dh7nHcLXfRDKHtdJoCnQ3efnwihI7/aU/dRL6SlrE1
         3nMne1sx5d0pEq96CK5dxzgN+SebJx5NQa1sf3iaM7wifI0QupzhFmgZJZzBI2ZYTpFN
         G4jKSNrEpZEGZfs3/+wo7iWaW7q9E+Dgsgky0VDoYXBWNcYfnl35X4qZYomKjVDhilPN
         aSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720525076; x=1721129876;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzsfjCRuMVXjrLoMzQVrdW0dNd+mgjm3CFp7vGGdMSY=;
        b=KZaFCBjxYWCj5gx2O+jPVtPGrnkrMhOileMJuO1/moF0LGQTeqQy9LNw2Dl2l2gfqV
         gbHsgQ9EDBB2OSJl6iZGmuuXoe4T6OrIe19pGfhozmS4fKlhUypj7euJUy39tNFZ+A7X
         jlHYe3DwDAAYkPm03FhJETgw3pX2AKrmJI6kbQIE9I9AHW/Y+n8mM/bN8Yesq5CI3peo
         cYAROMYUw7mOY7hkqbMIPMoyr2RIRmgWZH4mKox1ezvfSYWi8VNa5Rv+zyVMPWoMk/af
         cCRxiEslc/O0BJp4v7KG8SjncA1P9vdb5wVdqFbOA9kPlbZE0FdlQ6ZRin+wMfnuf6Jk
         AbXA==
X-Gm-Message-State: AOJu0YwvzhHP3PE1G2S3eNsNi0KhnGSNkc4QBvjnmNkOie+B13Qas8ar
	yhe/grGGC7b7xtE5Dc0SGG3MP9DXORbmnqkEfi8OxPFSQaSkPnFUf6Qv+8IfDGZjJRbmHmd//Rf
	vWzpOCbR1I1xHWZU9NEL5RkrV72ApTKZU
X-Google-Smtp-Source: AGHT+IHc+oJvO0N21NZ41c6FCsZxupksZDaUL/jvdvQDRgL4yxac29Rjy8QwXpWCiOCvDTkJEkIHtvwhgDWo7xoVqJY=
X-Received: by 2002:a05:6512:401a:b0:52e:9423:867f with SMTP id
 2adb3069b0e04-52eb99a137bmr1593047e87.36.1720525075516; Tue, 09 Jul 2024
 04:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kirill Yatsenko <kiriyatsenko@gmail.com>
Date: Tue, 9 Jul 2024 13:37:44 +0200
Message-ID: <CAH0WhdaLameP-Prvo0=empBsPhQu4CW+H4jKwwhe-gy1g4uMHw@mail.gmail.com>
Subject: Generic i2c recovery, STOP condition question
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'd like to know in which condition the STOP should be generated on the bus.

By default the SDA line is set to input in i2c-core, therefore no STOP condition
is send.

In the "Linux I2C fault injection" doc, it's written:

`This is why bus recovery (up to 9 clock pulses) must either check SDA or send
additional STOP conditions to ensure the bus has been released

But where it's coming from, is there any documentation specifying if
the controller need to generate STOP or not during the bus recovery?

For example, in AN-686 "Implementing an I2C Reset" by Analog Devices it is
written that the master needs to send STOP after it detects the SDA signal high.

Best Regards

