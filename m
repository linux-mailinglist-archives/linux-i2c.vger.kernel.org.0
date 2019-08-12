Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D797D897F4
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfHLHhn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:37:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55889 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfHLHhn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:37:43 -0400
Received: by mail-wm1-f65.google.com with SMTP id f72so11184377wmf.5
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=R1Be8onIeze9fs+7n3+/PpSy9/BtgjJpnC6Vyn42sUg=;
        b=GcYFmOnFusv3pzYSHDeHRfSifYRIiQ5M0sh9Q379q5WLzcuPw+CyFod55Tb1tJYSfH
         jrEDJxlOKgJc3ii8u4Mi8XyHKcHtQ7Sb8xykhjznT2KgkxCNZTbJkbsWrfe/FzbtTzMK
         D2sAEHhjedRpH0Nd41ejwL8sGGYzu+QU3dfvyNIss+NMyyTLLs7rt5CIKZFYdVQlcOey
         rKyG1SBQLz1cUGEGxGmKDgeiCQIoBhLp2eTxIkKVjk+8feijP+cHb+Fwh/PFstIOQoZN
         U7yofqZjAt+Htg+5oNpKL94aMO3K8RNgMhDkU2xMZxSOi2cYgB2xlwn4zCL6OAcDOX0a
         YJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=R1Be8onIeze9fs+7n3+/PpSy9/BtgjJpnC6Vyn42sUg=;
        b=Gmgvrh1MbtVBhvVKY+iNAAayB9erzLHWrsDzjRMD7AmCzIL7RZySR7dQW6Nae6fjld
         doAwC7xzZ7vZUh8CIRnPDs8v5h7jYHega9YTGLkQmORXWollqWMCc4ivXwzwtjn4ELuM
         AYlrYbPmcerqTpqxWDpLc725TAJPdc2PfLSp8OKGwJzm9/e0eITbTGZ0zQ8Ah31mXLw9
         DNV1PaknKXzuV9iWnUOab7CpofG2MNqvi+uXYGEdQIakQf3hmN4MU86XJ3jCj7JgSXH1
         Uz8/HI/f5zJg+QXGzjOuoMiVIhypt1zUzb85NK0Rf997V5qYNlSoC31X1tfJx0I34hUK
         KeDg==
X-Gm-Message-State: APjAAAUUZ6sRQTP5jByyMrltpryWmnhRg4cOyT60P4lUmOeOrZGwRrGN
        5tZgxajIvBo2bxk0JEP78eBYnkt9s8I=
X-Google-Smtp-Source: APXvYqyzEw8ku2htf6irDObh2g/4qIFq1aLn5f8fIpvd4e6FGw4qI9x7R+jtgWQvPv3rN1ZGlGlvAw==
X-Received: by 2002:a7b:c952:: with SMTP id i18mr11322397wml.44.1565595461020;
        Mon, 12 Aug 2019 00:37:41 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id a142sm10839483wme.2.2019.08.12.00.37.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:37:40 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:37:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: tps80031: convert to devm_i2c_new_dummy_device
Message-ID: <20190812073738.GP4594@dell>
References: <20190722172636.4589-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172636.4589-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019, Wolfram Sang wrote:

> Move from i2c_new_dummy() to devm_i2c_new_dummy_device(). So, we now get
> an ERRPTR which we use in error handling and we can skip removal of the
> created devices.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Only build tested. Part of a tree-wide move to deprecate
> i2c_new_dummy().
> 
>  drivers/mfd/tps80031.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
