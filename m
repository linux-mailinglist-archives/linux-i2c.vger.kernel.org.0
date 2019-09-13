Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D16B245D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2019 18:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbfIMQsa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Sep 2019 12:48:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46761 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730372AbfIMQsa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Sep 2019 12:48:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so18416573pfg.13
        for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2019 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gW2N1i3dQ1/II0tw58Dh1ejmikzhZEzu/mpUz8rB8wk=;
        b=NhMy/APOmMD+MCKdmXfxHm15pnSkr8an9PegqY0Y2Oaciv+OcSVZmqxex01mJc+5jf
         cdMMZw1sGC+Ywi9p0oLMw48fEOXjM6aQXpiIk5VnLV7EQeLKPbVtnMf0EyxbjUl+rwbX
         DyNm9MhF2SIUuSkrGoH6GkyCng7qh59zPzlsuSv16seUQQU2XHwC40sTnBDFF1z6NM5f
         GJZbN71I6HtwC/WnUiTC66jcwyls4kcpAw3ukVubDfVNqixpHQE2jhP7Nx9npuObsL+4
         FVpSRlyda2rbpCVgArCxOGK9YNb3IGrbqpngzTx63It0EijmPCdGy4JlT/Zmn+VctU8L
         RLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gW2N1i3dQ1/II0tw58Dh1ejmikzhZEzu/mpUz8rB8wk=;
        b=o429TOPa0lIteR/og8na8u0CBwRByLIUBPQBvXJyHzdRj6/H6/5987kNja03TrhsiL
         kNHsgNQCVwu6RrNLvLsQcIEchx5sfIeOBglCSSezo7Eouyps11zbdG4C5X8HtbHwg83V
         rfV6xDzZj+sSXiij/0185GTxchbh+DiLQFrR/3HoUpoJK8x3Y7zltebFwr56IqwKruq2
         THN+tiMLHqFit806ubaYh6lcNVNLBV2x4BLOMzkIQWLDE2wJgMdWsi3SCANYyjeDlM3o
         43ysn0rUSJr/wqnI5l3OZwuguiz8QvEPsNJfsI7dhOGFFSqqaDWSYBdrJQIjY9daq36f
         IC3A==
X-Gm-Message-State: APjAAAWClGs+j17rwA4ZfypsumfRLw2WqF13TXcXWxUaqLGIp3fKd37C
        eDRJkDCx68PvB3Ifv6YtwvyvRA==
X-Google-Smtp-Source: APXvYqwBu4eLOKb28t6qtNtdNBCKtNWHQYJ5sXVXd/zYhLtXCm0scT1SEcsP0hEMNdo7XbVmtYvSqw==
X-Received: by 2002:a17:90a:cc04:: with SMTP id b4mr6039257pju.127.1568393308933;
        Fri, 13 Sep 2019 09:48:28 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
        by smtp.gmail.com with ESMTPSA id v5sm30831622pfv.76.2019.09.13.09.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 09:48:28 -0700 (PDT)
Date:   Fri, 13 Sep 2019 09:48:23 -0700
From:   Brendan Higgins <brendanhiggins@google.com>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org,
        mark.rutland@arm.com, benh@kernel.crashing.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: Aspeed: Add AST2600 compatible
Message-ID: <20190913164823.GB52781@google.com>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 13, 2019 at 11:35:10AM -0500, Eddie James wrote:
> Document the AST2600 I2C bus compatible string.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
